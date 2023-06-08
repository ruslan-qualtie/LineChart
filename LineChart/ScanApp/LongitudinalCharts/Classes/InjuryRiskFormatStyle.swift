import Foundation

struct InjuryRiskFormatStyle: FormatStyle {
    typealias FormatInput = Float
    typealias FormatOutput = String
    
    func format(_ value: FormatInput) -> FormatOutput {
        InjuryRiskFormatter().format(value)
    }
}
