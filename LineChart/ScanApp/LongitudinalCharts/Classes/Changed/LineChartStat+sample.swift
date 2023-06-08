import Foundation

extension LineChartStat {
    static let sampleJumpHeightUnsidedNegativeDelta = LineChartStat(
        title: "Jump Height",
        score: "8.5 in",
        delta: .sampleUnsidedNegative
    )

    static let sampleBalanceLeftUnsidedNegativeDelta = LineChartStat(
        title: "Left",
        score: "73",
        delta: .sampleUnsidedNegative
    )

    static let sampleBalanceRightUnsidedPositiveDelta = LineChartStat(
        title: "Right",
        score: "78",
        delta: .sampleUnsidedPositive
    )

    static let sampleJumpLoadUnsidedNegativeDelta = LineChartStat(
        title: "Load",
        score: "55",
        delta: .sampleUnsidedNegative
    )

    static let sampleJumpExplodeUnsidedPositiveDelta = LineChartStat(
        title: "Explode",
        score: "38",
        delta: .sampleUnsidedPositive
    )

    static let sampleJumpDriveUnsidedPositiveDelta = LineChartStat(
        title: "Drive",
        score: "6",
        delta: .sampleNoChange
    )

    static let sampleJumpShiftLeftPositiveDelta = LineChartStat(
        title: "Jump Shift",
        score: "12 Right",
        delta: .sampleLeftPositive
    )

    static let sampleBalanceAsymmetryRightNegativeDelta = LineChartStat(
        title: "Balance Asymmetry",
        score: "8% Right",
        delta: .sampleRightNegative
    )
    
    static let sampleInjuryRiskNegative = LineChartStat(
        title: "Risk",
        score: "High",
        delta: .sampleFallRiskNegative
    )
}
