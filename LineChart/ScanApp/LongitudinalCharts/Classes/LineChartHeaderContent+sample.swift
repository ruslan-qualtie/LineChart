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
            description: "The Balance Scan consists of a series of single leg balance trials and is utilized to assess balance, "
                + "stability, and proprioception.",
            stats: [.sampleBalanceLeftUnsidedNegativeDelta, .sampleBalanceRightUnsidedPositiveDelta]
        )
    }

    static var sampleJump: LineChartHeaderContent {
        .init(
            title: "Jump",
            description: "The Jump Scan consists of a series of vertical jumps and is utilized to assess dynamic movement strategy and efficiency.",
            stats: [.sampleJumpLoadUnsidedNegativeDelta, .sampleJumpExplodeUnsidedPositiveDelta, .sampleJumpDriveUnsidedPositiveDelta]
        )
    }
}
