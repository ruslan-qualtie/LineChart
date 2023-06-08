import SwiftUI

struct CenterVerticallyInScrollView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minHeight: 580)
    }
}

extension View {
    func centerVerticallyInScrollView() -> some View {
        modifier(CenterVerticallyInScrollView())
    }
}
