import SwiftUI
import Charts

struct SwiftUILineChart: View {
    let dataSource: LineChartData
    
    var body: some View {
        Chart {
            ForEach(dataSource.lines) { line in
                ForEach(line.points, id: \.date) { point in
                    LineMark(
                        x: .value("Date", point.date),
                        y: .value("Value", point.value)
                    )
                }
                .foregroundStyle(by: .value("", line.name))
                .symbol(by: .value("", line.name))
            }
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .weekOfYear)) { value in
                AxisValueLabel(
                    format: .dateTime
                        .day(.twoDigits)
                        .month(.defaultDigits)
                        .locale(Locale(identifier: "en_US"))
                )
                .foregroundStyle(.geekblue3)
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading) {
                AxisGridLine()
                AxisValueLabel()
                    .foregroundStyle(.geekblue3)
            }
        }
        .chartLegend(.hidden)
    }
}

extension ShapeStyle where Self == Color {
    static var geekblue3: Color {
        Color("geekblue3")
    }
}
