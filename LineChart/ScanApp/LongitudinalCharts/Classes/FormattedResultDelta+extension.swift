import SwiftUI

extension FormattedResultDelta {
    var foregroundColor: Color {
        color(
            positive: .symmetryDeltaPositiveForeground,
            negative: .symmetryDeltaNegativeForeground,
            neutral: .symmetryDeltaNeutralForeground,
            zero: .symmetryDeltaZeroForeground
        )
    }

    var backgroundColor: Color {
        color(
            positive: .symmetryDeltaPositiveBackground,
            negative: .symmetryDeltaNegativeBackground,
            neutral: .symmetryDeltaNeutralBackground,
            zero: .symmetryDeltaZeroBackground
        )
    }

    private func color(positive: Color, negative: Color, neutral: Color, zero: Color) -> Color {
        switch change {
        case .zero:
            return zero
        case .neutral:
            return  neutral
        case .positive:
            return positive
        case .negative:
            return negative
        }
    }
}
