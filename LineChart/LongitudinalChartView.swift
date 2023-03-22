import SwiftUI

struct LongitudinalChartView: View {
    let dataSource: [LongitudinalChartData]
    var body: some View {
        ForEach(dataSource, id: \.name) { data in
            VStack(alignment: .leading, spacing: 4) {
                LineChartHeaderView(content: data.headerContent())
                LineChartView(points: data.metricPoints())
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

#if DEBUG
public struct LongitudinalChartView_Previews: PreviewProvider {
    public static var previews: some View {
        LongitudinalChartView(dataSource: dataSouce)
            .frame(minWidth: 1_240)
    }
}
#endif
