import SwiftUI

struct SidedResultDeltaView: View {
    let delta: FormattedResultDelta

    @ViewBuilder
    private var sideIcon: some View {
        Group {
            switch delta.side {
            case .none:
                EmptyView()
            case .left:
                Icons.arrowLeft()
            case .right:
                Icons.arrowRight()
            }
        }
        .font(.system(size: 12, weight: .regular))
    }

    var body: some View {
        HStack(spacing: 0) {
            sideIcon
            DeltaValueView(value: delta.value)
        }
        .style(delta: delta)
    }
}

#if DEBUG
public struct SidedResultDeltaView_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer([
            SidedResultDeltaView(delta: .sampleLeftPositive),
            SidedResultDeltaView(delta: .sampleRightPositive),
            SidedResultDeltaView(delta: .sampleUnsidedPositive),
            SidedResultDeltaView(delta: .sampleFallRiskPositive),
            SidedResultDeltaView(delta: .sampleLeftNegative),
            SidedResultDeltaView(delta: .sampleRightNegative),
            SidedResultDeltaView(delta: .sampleUnsidedNegative),
            SidedResultDeltaView(delta: .sampleFallRiskNegative),
            SidedResultDeltaView(delta: .sampleLeftNeutral),
            SidedResultDeltaView(delta: .sampleRightNeutral),
            SidedResultDeltaView(delta: .sampleNoChange)
        ])
        .background(Color.panelBackground)
    }
}
#endif
