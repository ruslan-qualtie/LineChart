import Foundation

extension LineChartHeaderContent {
    static var sampleJumpHeight: LineChartHeaderContent {
        .init(
            title: "Jump Height",
            description: "Jump height calculated by the integration of acceleration to determine exit velocity.",
            stats: [.sampleJumpHeightUnsidedNegativeDelta]
        )
    }

    static var sampleBalanceLR: LineChartHeaderContent {
        .init(
            title: "Balance L/R",
            description: "The Balance Signature represents an individual’s ability to maintain balance by minimizing motion and making "
            + "complex adjustments. A score of 50 is the population average, with typical scores ranging between 40-60.",
            stats: [.sampleBalanceLeftUnsidedNegativeDelta, .sampleBalanceRightUnsidedPositiveDelta]
        )
    }

    static var sampleJump: LineChartHeaderContent {
        .init(
            title: "Jump",
            description: "Derived from the most recent Jump Scan, Risk stratifies relative musculoskeletal injury risk utilizing our "
            + "base athletic population model.",
            stats: [.sampleJumpLoadUnsidedNegativeDelta, .sampleJumpExplodeUnsidedPositiveDelta, .sampleJumpDriveUnsidedPositiveDelta]
        )
    }
    
    static var sampleRisk: LineChartHeaderContent {
        .init(
            title: "Risk",
            description: "Derived from the most recent Jump Scan, Risk stratifies relative musculoskeletal injury risk utilizing our "
            + "base athletic population model.",
            stats: [.sampleInjuryRiskNegative]
        )
    }
}
