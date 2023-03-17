import SwiftUI

struct DeltaValueView: View {
    let value: String
    let isNeutral: Bool

    private var foregroundColor: Color {
        isNeutral ? .statDeltaNeutral : value.statForegroundColor
    }

    private var backgroundColor: Color {
        isNeutral ? .statDeltaNeutralBackground : value.statBackgroundColor
    }

    private var rendererView: some View {
        Group {
            if let icon = value.systemIconName {
                Image(systemName: icon)
            } else {
                Text(value)
            }
        }
    }

    var body: some View {
        rendererView
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(foregroundColor)
            .fixedSize()
            .padding(.horizontal, 4)
            .padding(.vertical, 3)
            .background(backgroundColor)
            .cornerRadius(4)
    }
}

#if DEBUG
public struct DeltaView_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer([
            DeltaValueView(value: "-5.5", isNeutral: false),
            DeltaValueView(value: .enDash, isNeutral: false),
            DeltaValueView(value: "+5.5", isNeutral: false),
            DeltaValueView(value: "+3.8", isNeutral: true)
        ])
    }
}
#endif
