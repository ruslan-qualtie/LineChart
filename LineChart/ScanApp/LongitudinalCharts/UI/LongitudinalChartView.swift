import SwiftUI

struct LongitudinalChartView: View {
    let dataSource: LongitudinalChartData

    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 32) {
                LineChartHeaderView(content: dataSource.header)
                LineChartView(chartData: dataSource.data)
            }
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.opaquePanelBackground)
            )
        }
    }
}

#if DEBUG
public struct LongitudinalChartView_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer(
            [
                LongitudinalChartView(dataSource: .sampleJumpHeight),
                LongitudinalChartView(dataSource: .sampleBalanceLR),
                LongitudinalChartView(dataSource: .sampleJump)
            ],
            itemSize: .init(width: 1_240, height: 524))
    }
}
#endif
