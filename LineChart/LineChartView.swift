import SwiftUI
import Charts

struct LineChartView: View {
    let chartData: LineChartData
    @State private var isDragging = false
    @State private var isHovering = false
    @State private var isSwappped = false
    @State private var selectedDate: Date?
    
    let chartForegroundStyleRange: [Color] = [
        .firstLine,
        .secondLine,
        .thirdLine,
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
            }
            if isDragging && selectedDate != nil {
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
        }
        .chartForegroundStyleScale(range: chartForegroundStyleRange)
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
        .chartLegend(position: .automatic, alignment: .leading, spacing: 8) {
            HStack {
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 25, height: 2)
                    .foregroundColor(.white)
                Text("Average for Age")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
        }
        .chartOverlay { proxy in
            GeometryReader { geometry in
                Rectangle().fill(.clear).contentShape(Rectangle())
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
                            }
                    )
            }
        }
        .frame(minHeight: 376)
    }
}
