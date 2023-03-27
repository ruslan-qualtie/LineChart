import Charts
import SwiftUI

struct LineChartLegendItem {
    let stat: BarChartStat
    let description: LineChartLegendDescription?

    init(stat: BarChartStat, symbol: LineChartLegendDescription? = nil) {
        self.stat = stat
        self.description = symbol
    }
}

extension LineChartLegendItem {
    static var spartaScore: LineChartLegendItem {
        .init(stat: .spartaScoreNegativeDelta)
    }

    static var jumpHeight: LineChartLegendItem {
        .init(stat: .jumpHeightNegativeDelta)
    }

    static var balance: LineChartLegendItem {
        .init(stat: .balancePositiveDelta)
    }

    static var load: LineChartLegendItem {
        .init(stat: .loadNegativeDelta, symbol: .load)
    }

    static var explode: LineChartLegendItem {
        .init(stat: .explodePositiveDelta, symbol: .explode)
    }

    static var drive: LineChartLegendItem {
        .init(stat: .drivePositiveDelta, symbol: .drive)
    }

    static var left: LineChartLegendItem {
        .init(stat: .leftPositiveDelta, symbol: .left)
    }

    static var right: LineChartLegendItem {
        .init(stat: .rightNegativeDelta, symbol: .right)
    }
}
