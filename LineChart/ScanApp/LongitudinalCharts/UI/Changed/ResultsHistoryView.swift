import SwiftUI

struct ResultsHistoryView: View {
    let longitudinalCharts: [LongitudinalChartData]

    var body: some View {
        LongitudinalChartsListView(dataSources: longitudinalCharts)
            .centerVerticallyInScrollView()
    }
}

#if DEBUG
public struct ResultsHistoryView_Previews: PreviewProvider {
    public static var previews: some View {
        ResultsHistoryView(
            longitudinalCharts: [
                .sampleJumpHeight,
                .sampleJump,
                .sampleBalanceLR
            ]
        )
        .frame(width: 1_240)
    }
}
#endif
