import Foundation

extension LineChartData {
    public static var sampleChartJumpHeight: LineChartData {
        .init(lines: [.sampleLineJumpHeight], name: "Jump Height")
    }

    public static var sampleChartBalanceLR: LineChartData {
        .init(lines: [.sampleLineBalanceLeft, .sampleLineBalanceRight], name: "BalanceLR")
    }

    public static var sampleChartJump: LineChartData {
        .init(lines: [.sampleLineJumpLoad, .sampleLineJumpExpload, .sampleLineJumpDrive], name: "Jump")
    }
    
    public static var sampleInjuryRisk: LineChartData {
        .init(lines: [.sampleLineInjuryRisk], name: "Risk")
    }
}
