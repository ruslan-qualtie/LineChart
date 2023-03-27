import SwiftUI
import Charts

struct LineChartView: View {
    let chartData: LineChartData
    @State private var isDragging = false
    @State private var isHovering = false
    @State private var isSwappped = false
    @State private var selectedDate: Date?
    @State private var selectedValue: Double?
    
    let chartForegroundStyleRange: [Color] = [
        .firstLine,
        .secondLine,
        .thirdLine
    ]
    
    var body: some View {
        Chart {
            if chartData.averageForAge != nil {
                RuleMark(y: .value("Average For Age", chartData.averageForAge!))
                .foregroundStyle(Color.white)
                .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
            }
            ForEach(chartData.lines) { line in
                ForEach(line.points, id: \.date) { point in
                    LineMark(x: point.plottableDate, y: point.plottableValue)
                }
                .symbol(by: line.plottableName)
                .symbolSize(CGSize(width: 8, height: 8))
                .foregroundStyle(by: line.plottableName)
                .lineStyle(StrokeStyle(lineWidth: 2))
                // .interpolationMethod(.catmullRom)
            }
            if showSelectionRule() {
                RuleMark(x: .value("Selected Date", selectedDate!))
                .foregroundStyle(Color.axisValueLabel)
                .lineStyle(StrokeStyle(lineWidth: 1))
                .annotation(
                    position: isSwappped ? .leading : .trailing,
                    alignment: .topLeading,
                    spacing: 8
                ) {
                    SelectionRuleAnnotationView(
                        content: SelectionRuleAnnotationBuilder(
                            chart: chartData,
                            date: selectedDate!
                        )
                        .build()
                    )
                }
            }
            #if os(macOS)
            if isDragging && selectedValue != nil && selectedDate != nil {
                RuleMark(y: .value("Value", selectedValue!))
                    .foregroundStyle(Color.white)
                    .lineStyle(StrokeStyle(lineWidth: 1))
                RuleMark(x: .value("Date", selectedDate!))
                    .foregroundStyle(Color.white)
                    .lineStyle(StrokeStyle(lineWidth: 1))
                .annotation(
                    position: isSwappped ? .leading : .trailing,
                    alignment: .topLeading,
                    spacing: 8
                ) {
                    SearchRuleAnnotationView(date: selectedDate!, value: selectedValue!)
                }
            }
            #endif
        }
        .chartForegroundStyleScale(range: chartForegroundStyleRange)
        .averageForAgeLegend(chartData.averageForAge != nil)
        .chartXAxis {
            AxisMarks(values: .stride(by: .month)) { value in
                AxisValueLabel(
                    format: .dateTime
                        .day(.twoDigits)
                        .month(.defaultDigits)
                        .locale(Locale(identifier: "en_US"))
                )
                .foregroundStyle(Color.axisValueLabel)
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading) {
                AxisGridLine(stroke: StrokeStyle(lineWidth: 1.0))
                    .foregroundStyle(Color.axisGridLine)
                AxisValueLabel()
                    .foregroundStyle(Color.axisValueLabel)
            }
        }
        .chartOverlay { proxy in
            GeometryReader { geometry in
                Rectangle().fill(.clear).contentShape(Rectangle())
                #if os(macOS)
                    .gesture(
                        DragGesture()
                            .onEnded { _ in
                                isDragging = false
                                selectedDate = nil
                                selectedValue = nil
                            }
                            .onChanged { value in
                                let frame = geometry[proxy.plotAreaFrame]
                                guard frame.contains(value.location) else {
                                    isDragging = false
                                    selectedDate = nil
                                    selectedValue = nil
                                    return
                                }
                                let location = CGPoint(x: value.location.x - frame.origin.x, y: value.location.y - frame.origin.y)
                                isDragging = true
                                isSwappped = location.x >= proxy.plotAreaSize.width / 2.0
                                let (date, value) = proxy.value(at: location, as: (Date, Double).self)!
                                selectedDate = date
                                selectedValue = value
                            }
                    )
                    .onContinuousHover { phase in
                        withAnimation {
                            if isDragging {
                                isHovering = false
                                return
                            }
                            switch phase {
                            case .active(let location):
                                let frame = geometry[proxy.plotAreaFrame]
                                guard frame.contains(location) else {
                                    isHovering = false
                                    selectedDate = nil
                                    return
                                }
                                isHovering = true
                                let locationX = location.x - frame.origin.x
                                isSwappped = locationX >= proxy.plotAreaSize.width / 2.0
                                let date = proxy.value(atX: locationX, as: Date.self)!
                                let nearestDate = chartData.findNearestDate(to: date)
                                selectedDate = nearestDate
                            case .ended:
                                isHovering = false
                            }
                        }
                    }
                #elseif os(iOS)
                    .simultaneousGesture(
                        DragGesture(minimumDistance: 0)
                            .onEnded { _ in
                            isDragging = false
                            selectedDate = nil
                        }
                        .onChanged { value in
                            let frame = geometry[proxy.plotAreaFrame]
                            guard frame.contains(value.location) else {
                                isDragging = false
                                selectedDate = nil
                                return
                            }
                            isDragging = true
                            let locationX = value.location.x - frame.origin.x
                            isSwappped = locationX >= proxy.plotAreaSize.width / 2.0
                            let date = proxy.value(atX: locationX, as: Date.self)!
                            let nearestDate = chartData.findNearestDate(to: date)
                            selectedDate = nearestDate
                        },
                        including: .gesture
                    )
                #endif
            }
        }
        .frame(minHeight: 376)
    }
    
    func showSelectionRule() -> Bool {
        #if os(macOS)
        isHovering && selectedDate != nil
        #elseif os(iOS)
        isDragging && selectedDate != nil
        #endif
    }
}

#if DEBUG
public struct LineChartView_Previews: PreviewProvider {
    public static var previews: some View {
        LineChartView(chartData: chartSpartaScore)
        .frame(minWidth: 1_240)
    }
}
#endif
