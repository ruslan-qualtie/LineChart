import SwiftUI
import Charts

struct LineChartLegendItemView: View {
    let item: LineChartLegendItem

    var body: some View {
        VStack(alignment: .trailing) {
            BarChartStatView(stat: item.stat)
            HStack {
                item.symbol
                    .strokeBorder(lineWidth: 2)
                    .foregroundColor(item.color)
                    .frame(width: 13, height: 13)
                Text(item.name)
                    .font(.system(size: 14))
                    .foregroundColor(.axisValueLabel)
            }
        }
    }
}

#if DEBUG
public struct LineChartLegendItem_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer([
            LineChartLegendItemView(item: .load),
            LineChartLegendItemView(item: .explode),
            LineChartLegendItemView(item: .drive)
        ])
    }
}
#endif
