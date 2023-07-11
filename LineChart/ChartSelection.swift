import SwiftUI
import Charts

struct ChartSelection: ViewModifier {
    @Binding var selectedDate: Date?

    private func setSelectedDateBy(location: CGPoint, geometryProxy: GeometryProxy, chartProxy: ChartProxy) {
        let frame = geometryProxy[chartProxy.plotAreaFrame]
        guard frame.contains(location) else {
            selectedDate = nil
            return
        }
        let locationX = location.x - frame.origin.x
        selectedDate = chartProxy.value(atX: locationX, as: (Date).self)
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
                            selectedDate = nil
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
                                selectedDate = nil
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
