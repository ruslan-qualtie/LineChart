import Foundation

extension FormattedResultDelta {
    static let sampleWeight = FormattedResultDelta(value: "+8.3", side: .none, change: .neutral, significantChange: .positiveLarge)
    static let sampleJumpHeight = FormattedResultDelta(value: "-5.1", side: .none, change: .negative, significantChange: .negativeLarge)
    static let sampleSpartaScore = FormattedResultDelta(value: "+5", side: .none, change: .positive, significantChange: .positiveModerate)
    static let sampleBalanceStabilityScore = FormattedResultDelta(value: "-2", side: .none, change: .negative, significantChange: .negativeModerate)

    static let sampleNoChange = FormattedResultDelta(value: .enDash, side: .none, change: .zero)

    static let sampleFallRiskPositive = FormattedResultDelta(value: .arrowDownIcon, side: .none, change: .positive)
    static let sampleFallRiskNegative = FormattedResultDelta(value: .arrowUpIcon, side: .none, change: .negative)

    static let sampleChartPositive = FormattedResultDelta(value: "+3", side: .none, change: .positive, significantChange: .positiveModerate)
    static let sampleChartNegative = FormattedResultDelta(value: "-3", side: .none, change: .negative, significantChange: .negativeModerate)

    static let sampleLeftPositive = FormattedResultDelta(value: "2", side: .left, change: .positive)
    static let sampleRightPositive = FormattedResultDelta(value: "12", side: .right, change: .positive)

    static let sampleLeftNegative = FormattedResultDelta(value: "12", side: .left, change: .negative)
    static let sampleRightNegative = FormattedResultDelta(value: "2", side: .right, change: .negative)

    static let sampleLeftNeutral = FormattedResultDelta(value: "8", side: .left, change: .neutral)
    static let sampleRightNeutral = FormattedResultDelta(value: "8", side: .right, change: .neutral)

    static let sampleUnsidedPositive = FormattedResultDelta(value: "+2", side: .none, change: .positive)
    static let sampleUnsidedNegative = FormattedResultDelta(value: "-10", side: .none, change: .negative)
}
