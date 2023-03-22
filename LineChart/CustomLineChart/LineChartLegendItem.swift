import Charts
import SwiftUI

struct LineChartLegendItem {
    let name: String
    let symbol: BasicChartSymbolShape
    let color: Color
    let stat: BarChartStat
}

extension LineChartLegendItem {
    static var right: LineChartLegendItem {
        .init(name: "Right", symbol: .circle, color: .firstLine, stat: .rightNegativeDelta)
    }

    static var load: LineChartLegendItem {
        .init(name: "Load", symbol: .circle, color: .firstLine, stat: .loadNegativeDelta)
    }
    
    static var explode: LineChartLegendItem {
        .init(name: "Explode", symbol: .square, color: .secondLine, stat: .explodePositiveDelta)
    }
    
    static var drive: LineChartLegendItem {
        .init(name: "Drive", symbol: .triangle, color: .thirdLine, stat: .drivePositiveDelta)
    }

    static var left: LineChartLegendItem {
        .init(name: "Left", symbol: .circle, color: .firstLine, stat: .leftPositiveDelta)
    }

    static var spartaScore: LineChartLegendItem {
        .init(name: "Sparta Score", symbol: .circle, color: .firstLine, stat: .spartaScoreNegativeDelta)
    }
}
