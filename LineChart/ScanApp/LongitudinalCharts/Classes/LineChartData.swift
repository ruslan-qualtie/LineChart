import Foundation

public struct LineChartData {
    public let lines: [LineData]
    public let name: String

    public init(lines: [LineData], name: String) {
        self.lines = lines
        self.name = name
    }
}

extension LineChartData: Equatable {}

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
