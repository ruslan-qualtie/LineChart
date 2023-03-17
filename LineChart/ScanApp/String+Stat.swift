import SwiftUI

extension String {
    private var isNegative: Bool {
        hasPrefix("-") || hasPrefix(.arrowUpIcon)
    }

    private var isPositive: Bool {
        hasPrefix("+") || hasPrefix(.arrowDownIcon)
    }

    var systemIconName: String? {
        hasPrefix(.iconSign) ? replacingOccurrences(of: String.iconSign, with: "") : nil
    }

    var statForegroundColor: Color {
        color(
            positive: .statDeltaPositive,
            negative: .statDeltaNegative,
            zero: .statDeltaZero
        )
    }

    var statBackgroundColor: Color {
        color(
            positive: .statDeltaPositive.opacity(0.1),
            negative: .statDeltaNegative.opacity(0.1),
            zero: .statDeltaZero.opacity(0.2)
        )
    }

    private func color(positive: Color, negative: Color, zero: Color) -> Color {
        switch self {
        case let value where value.isPositive:
            return positive
        case let value where value.isNegative:
            return negative
        default:
            return zero
        }
    }
}
