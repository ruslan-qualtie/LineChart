public struct BarChartStat {
    public let title: String
    public let score: String
    public let delta: FormattedResultDelta?

    public init(title: String, score: String, delta: FormattedResultDelta? = nil) {
        self.title = title
        self.score = score
        self.delta = delta
    }
}

extension BarChartStat: Equatable {}
