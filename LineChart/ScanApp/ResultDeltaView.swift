import SwiftUI

struct ResultDeltaView: View {
    let delta: FormattedResultDelta
    let isNeutral: Bool

    var body: some View {
        HStack {
            DeltaValueView(value: delta.value, isNeutral: isNeutral)
            if let significantChange = delta.significantChange {
                DeltaChangeView(significantChange: significantChange)
            }
        }
    }
}

#if DEBUG
public struct ResultDeltaView_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer([
            ResultDeltaView(
                delta: .sampleWeight,
                isNeutral: true
            ),
            ResultDeltaView(
                delta: .sampleJumpHeight,
                isNeutral: false
            ),
            ResultDeltaView(
                delta: .sampleSpartaScore,
                isNeutral: false
            ),
            ResultDeltaView(
                delta: .sampleNoChange,
                isNeutral: false
            )
        ])
    }
}
#endif
