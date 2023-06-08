import SwiftUI

struct LineChartStatView: View {
    let stat: LineChartStat

    var body: some View {
        HStack(spacing: 6) {
            Text(stat.score)
                .font(.system(size: 30, weight: .regular))
                .frame(height: 32)
                .foregroundColor(.chartStatScore)
            if let delta = stat.delta {
                SidedResultDeltaView(delta: delta)
            }
        }
    }
}

#if DEBUG
public struct LineChartStatView_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer(
            [
                LineChartStatView(stat: .sampleBalanceRightUnsidedPositiveDelta),
                LineChartStatView(stat: .sampleJumpHeightUnsidedNegativeDelta),
                LineChartStatView(stat: .sampleJumpDriveUnsidedPositiveDelta),
                LineChartStatView(stat: .sampleJumpShiftLeftPositiveDelta),
                LineChartStatView(stat: .sampleBalanceAsymmetryRightNegativeDelta)
            ]
        )
        .background(Color.panelBackground)
    }
}
#endif
