import SwiftUI

struct DeltaValueView: View {
    let value: String

    var body: some View {
        Group {
            if let icon = value.systemIconName {
                Image(systemName: icon)
            } else {
                Text(value)
            }
        }
        .font(.system(size: 12, weight: .regular))
        .fixedSize()
    }
}

#if DEBUG
public struct DeltaView_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer([
            DeltaValueView(value: "-5.5"),
            DeltaValueView(value: .enDash),
            DeltaValueView(value: .arrowUpIcon)
        ])
    }
}
#endif
