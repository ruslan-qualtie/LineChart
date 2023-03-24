import Foundation

public struct SelectionRuleAnnotation {
    let headLines: [String]
    let bottomLine: String
}

extension SelectionRuleAnnotation {
    static var sample: SelectionRuleAnnotation {
        .init(
            headLines: [
                "Metrtic 01: Value 01",
                "Metrtic 02: Value 02",
                "Metrtic 03: Value 03"
            ],
            bottomLine: "DATE STRING"
        )
    }
}
