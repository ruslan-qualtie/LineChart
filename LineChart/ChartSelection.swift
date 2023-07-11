import SwiftUI
import Charts

struct ChartSelection: ViewModifier {
    @Binding var selectedDate: Date?

    private func resetSelectedDate() {
        selectedDate = nil
    }
    
    private func setSelectedDateBy(location: CGPoint, geometryProxy: GeometryProxy, chartProxy: ChartProxy) {
        let frame = geometryProxy[chartProxy.plotAreaFrame]
        if frame.contains(location) {
            let locationX = location.x - frame.origin.x
            selectedDate = chartProxy.value(atX: locationX, as: (Date).self)
        } else {
            resetSelectedDate()
        }
    }

    func body(content: Content) -> some View {
        content.chartOverlay { chartProxy in
            GeometryReader { geometryProxy in
                Rectangle()
                    .fill(.clear)
                    .contentShape(Rectangle())
                    #if os(macOS)
                    .onContinuousHover { hoverPhase in
                        switch hoverPhase {
                        case .active(let hoverLocation):
                            setSelectedDateBy(
                                location: hoverLocation,
                                geometryProxy: geometryProxy,
                                chartProxy: chartProxy
                            )
                        case .ended:
                            resetSelectedDate()
                        }
                    }
                    #elseif os(iOS)
                    .simultaneousGesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { gestureValue in
                                setSelectedDateBy(
                                    location: gestureValue.location,
                                    geometryProxy: geometryProxy,
                                    chartProxy: chartProxy
                                )
                            }
                            .onEnded { _ in
                                resetSelectedDate()
                            },
                        including: .gesture
                    )
                    #endif
            }
        }
    }
}

extension View {
    func chartSelection(value: Binding<Date?>) -> some View {
        modifier(ChartSelection(selectedDate: value))
    }
}
