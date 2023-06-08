import Foundation

public struct LineChartHeaderContent {
    public let title: String
    public let description: String
    public let stats: [LineChartStat]

    public init(title: String, description: String, stats: [LineChartStat]) {
        self.title = title
        self.description = description
        self.stats = stats
    }
}

extension LineChartHeaderContent: Equatable {}
