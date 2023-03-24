import SwiftUI

struct LongitudinalChartView: View {
    let dataSource: [LineChartData]
    var body: some View {
        VStack(spacing: 16) {
            ForEach(dataSource, id: \.name) { chart in
                VStack(alignment: .leading, spacing: 4) {
                    LineChartHeaderView(content: chart.header)
                    LineChartView(chartData: chart)
                    .padding(.top, 20)
                }
                .padding(24)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color("chart").opacity(0.03))
                )
            }
        }
    }
}

#if DEBUG
public struct LongitudinalChartView_Previews: PreviewProvider {
    public static var previews: some View {
        LongitudinalChartView(dataSource: dataSouce)
            .frame(minWidth: 1_240)
    }
}
#endif
