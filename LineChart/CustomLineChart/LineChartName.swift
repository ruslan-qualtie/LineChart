import Foundation

enum LineChartName: String {
case spartaScore
case jumpHeight
case jumpLED
case balanceLR
    
    var headerContent: LineChartHeaderContent {
        switch self {
        case .spartaScore: return .spartaScore
        case .jumpHeight: return .jumpHeight
        case .jumpLED: return .jumpLED
        case .balanceLR: return.balanceLR
        }
    }
}
