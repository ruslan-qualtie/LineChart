import Foundation

public enum InjuryRisk: Int, Equatable, CaseIterable {
    case low = 1
    case belowAverage = 2
    case average = 3
    case aboveAverage = 4
    case high = 5

    public init?(rawValue: Float) {
        self.init(rawValue: Int(rawValue))
    }
}

extension InjuryRisk {
    public var name: String {
        switch self {
        case .low: return "Low"
        case .belowAverage: return "Below Average"
        case .average: return "Average"
        case .aboveAverage: return "Above Average"
        case .high: return "High"
        }
    }
}
