import Charts
import SwiftUI

struct LineChartLegendDescription {
    let name: String
    let symbol: BasicChartSymbolShape
    let color: Color
}

extension LineChartLegendDescription {
    static var load: LineChartLegendDescription {
        .init(name: "Load", symbol: .circle, color: .firstLine)
    }
    
    static var explode: LineChartLegendDescription {
        .init(name: "Explode", symbol: .square, color: .secondLine)
    }
    
    static var drive: LineChartLegendDescription {
        .init(name: "Drive", symbol: .triangle, color: .thirdLine)
    }
    
    static var left: LineChartLegendDescription {
        .init(name: "Left", symbol: .circle, color: .firstLine)
    }
    
    static var right: LineChartLegendDescription {
        .init(name: "Right", symbol: .circle, color: .firstLine)
    }
}
