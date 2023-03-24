import Foundation

struct SelectionRuleAnnotationBuilder {
    let chart: LineChartData
    let date: Date
}

extension SelectionRuleAnnotationBuilder {
    func build() -> SelectionRuleAnnotation {
        var headLines: [String] = []

        for line in chart.lines {
            for point in line.points {
                if point.date == date {
                    headLines.append("\(line.name): \(Int(point.value))")
                    break
                }
            }
        }

        return .init(
            headLines: headLines,
            bottomLine: DateFormatter.short.string(from: date)
        )
    }
}
