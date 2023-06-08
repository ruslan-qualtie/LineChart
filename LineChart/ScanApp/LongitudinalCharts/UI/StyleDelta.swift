import SwiftUI

struct StyleDelta: ViewModifier {
    private let delta: FormattedResultDelta

    // workaround for #coverage
    public init(_ delta: FormattedResultDelta) {
        self.delta = delta
    }

    func body(content: Content) -> some View {
        content
            .foregroundColor(delta.foregroundColor)
            .padding(.horizontal, 4)
            .padding(.vertical, 3)
            .background(delta.backgroundColor)
            .cornerRadius(4)
    }
}

extension View {
    func style(delta: FormattedResultDelta) -> some View {
        modifier(StyleDelta(delta))
    }
}
