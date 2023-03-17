import SwiftUI

struct BarChartStatView: View {
    let stat: BarChartStat

    var body: some View {
        HStack(spacing: 6) {
            Text(stat.score)
                .font(.system(size: 30, weight: .regular))
                .frame(height: 32)
                .foregroundColor(.chartStatScore)
            if let delta = stat.delta {
                ResultDeltaView(delta: delta, isNeutral: false)
            }
        }
    }
}

#if DEBUG
public struct BarChartStatView_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer([
            BarChartStatView(stat: .driveNoDelta),
            BarChartStatView(stat: .balancePositiveDelta)
        ])
        .background(Color.panelBackground)
    }
}
#endif
