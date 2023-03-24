import SwiftUI

struct LineChartHeaderView: View {
    let content: LineChartHeaderContent

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(content.title)
                    .font(.system(size: 16))
                    .foregroundColor(Color("geekblue-3"))
                Text(content.description)
                    .font(.system(size: 16, weight: .thin))
                    .foregroundColor(.white)
                    .lineSpacing(4)
                    .tracking(0.52)
            }
            Spacer(minLength: 220)
            HStack(spacing: 36) {
                ForEach(content.legendItems, id: \.name) { item in
                    LineChartLegendItemView(item: item)
                }
            }
        }
    }
}

#if DEBUG
public struct LongitudinalChartHeaderView_Previews: PreviewProvider {
    public static var previews: some View {
        LineChartHeaderView(content: .jump)
        .frame(minWidth: 1_240)
    }
}
#endif
