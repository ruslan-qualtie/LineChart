import Foundation

struct LineChartHeaderContent {
    let title: String
    let description: String
    let legendItems: [LineChartLegendItem]
}

extension LineChartHeaderContent {
    static var spartaScore: LineChartHeaderContent {
        .init(
            title: "Sparta Score",
            description: "Derived from the most recent Jump Scan, Sparta Score represents an individual’s dynamic movement efficiency. Higher scores indicate better efficiency, with typical values ranging between 75-85.",
            legendItems: [
                .spartaScore
            ]
        )
    }

    static var jumpHeight: LineChartHeaderContent {
        .init(
            title: "Jump Height",
            description: "Jump height calculated by the integration of acceleration to determine exit velocity",
            legendItems: []
        )
    }
    static var jumpLED: LineChartHeaderContent {
        .init(
            title: "Jump",
            description: "The Jump Scan consists of a series of vertical jumps and is utilized to assess dynamic movement strategy and efficiency.",
            legendItems: [
                .load,
                .explode,
                .drive
            ]
        )
    }
    
    static var balanceLR: LineChartHeaderContent {
        .init(
            title: "Balance L/R",
            description: "The Balance Scan consists of a series of single leg balance trials and is utilized to assess balance, stability, and proprioception.",
            legendItems: [
                .left,
                .right
            ]
        )
    }
}
