extension FormattedResultDelta {
    static let sampleWeight = FormattedResultDelta(value: "+8.3", significantChange: .positiveLarge)
    static let sampleJumpHeight = FormattedResultDelta(value: "-5.1", significantChange: .negativeLarge)
    static let sampleSpartaScore = FormattedResultDelta(value: "+5", significantChange: .positiveModerate)
    static let sampleBalanceStabilityScore = FormattedResultDelta(value: "-2", significantChange: .negativeModerate)

    static let sampleNoChange = FormattedResultDelta(value: .enDash)

    static let sampleFallRiskPositive = FormattedResultDelta(value: .arrowUpIcon)
    static let sampleFallRiskNegative = FormattedResultDelta(value: .arrowDownIcon)

    static let sampleChartPositive = FormattedResultDelta(value: "+3", significantChange: .positiveModerate)
    static let sampleChartNegative = FormattedResultDelta(value: "-3", significantChange: .negativeModerate)
}
