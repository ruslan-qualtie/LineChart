import SwiftUI

struct LongitudinalChartsListView: View {
    let dataSources: [LongitudinalChartData]

    var body: some View {
        VStack(spacing: 16) {
            ForEach(0..<dataSources.count, id: \.self) {
                LongitudinalChartView(dataSource: dataSources[$0])
                    .frame(height: 376)
            }
        }
    }
}

#if DEBUG
public struct LongitudinalChartsListView_Previews: PreviewProvider {
    public static var previews: some View {
        LongitudinalChartsListView(dataSources: [
            .sampleJumpHeight,
            .sampleJump,
            .sampleBalanceLR
        ])
        .frame(width: 1_240)
    }
}
#endif
