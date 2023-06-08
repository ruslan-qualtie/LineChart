import Foundation

public protocol InjuryRiskFormatterType {
    func format(_ value: Float?) -> String
}

public class InjuryRiskFormatter: Initializable {}

extension InjuryRiskFormatter: InjuryRiskFormatterType {
    public func format(_ value: Float?) -> String {
        guard let rawValue = value, let risk = InjuryRisk(rawValue: rawValue) else {
            return .noScore
        }
        return risk.name
    }
}
