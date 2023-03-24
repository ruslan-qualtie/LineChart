import Foundation

struct LineChartData {
    let lines: [LineData]
    let name: String
    let header: LineChartHeaderContent
    let averageForAge: Double?
    
    init(lines: [LineData], name: String, header: LineChartHeaderContent, averageForAge: Double? = nil) {
        self.lines = lines
        self.name = name
        self.header = header
        self.averageForAge = averageForAge
    }
}

extension LineChartData {
    func findNearestDate(to selected: Date) -> Date? {
        let dates = lines
            .flatMap(\.points)
            .map(\.date)
            .reduce([Date](), { $0.contains($1) ? $0 : $0 + [$1] })
        var minDistance: TimeInterval = .infinity
        var result: Date? = nil
        for date in dates {
            let distance = abs(date.distance(to: selected))
            if distance < minDistance {
                minDistance = distance
                result = date
            }
        }
        return result
    }
}
