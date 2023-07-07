import Foundation

extension LineChartData {
    public static var sampleChartJumpHeight: LineChartData {
        .init(lines: [.sampleLineJumpHeight])
    }

    public static var sampleChartBalanceLR: LineChartData {
        .init(lines: [.sampleLineBalanceLeft, .sampleLineBalanceRight])
    }

    public static var sampleChartJump: LineChartData {
        .init(lines: [.sampleLineJumpLoad, .sampleLineJumpExpload, .sampleLineJumpDrive])
    }

    public static var sampleInjuryRisk: LineChartData {
        .init(
            lines: [.sampleLineInjuryRisk],
            yAxisLabels: InjuryRisk.yAxisLabels
        )
    }

    public static var sampleChartJumpHeightOnePoint: LineChartData {
        .init(lines: [.sampleLineJumpHeightOnePoint])
    }

    public static var sampleChartBalanceLROnePoint: LineChartData {
        .init(lines: [.sampleLineBalanceLeftOnePoint, .sampleLineBalanceRightOnePoint])
    }

    public static var sampleChartJumpOnePoint: LineChartData {
        .init(lines: [.sampleLineJumpLoadOnePoint, .sampleLineJumpExploadOnePoint, .sampleLineJumpDriveOnePoint])
    }

    public static var sampleInjuryRiskOnePoint: LineChartData {
        .init(
            lines: [.sampleLineInjuryRiskOnePoint],
            yAxisLabels: InjuryRisk.yAxisLabels
        )
    }
}
