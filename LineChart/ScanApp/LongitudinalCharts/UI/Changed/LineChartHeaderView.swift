import SwiftUI

struct LineChartHeaderView: View {
    let content: LineChartHeaderContent

    private var statsView: some View {
        HStack(alignment: .top, spacing: 36) {
            ForEach(content.stats.indices, id: \.self) { index in
                VStack(alignment: .trailing, spacing: 0) {
                    LineChartStatView(stat: content.stats[index])
                    if content.stats.count > 1 {
                        LineChartLegendItemView(
                            index: index,
                            title: content.stats[index].title
                        )
                    }
                }
            }
        }
    }

    private var infoView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(content.title)
                .font(.system(size: 16))
                .foregroundColor(.axisValueLabel)
            Text(content.description)
                .font(.system(size: 16, weight: .thin))
                .foregroundColor(.white)
                .lineSpacing(4)
        }
    }

    var body: some View {
        HStack(alignment: .top) {
            infoView
                .frame(maxWidth: 800, alignment: .leading)
            Spacer()
            statsView
        }
    }
}

#if DEBUG
public struct LineChartHeaderView_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer(
            [
                LineChartHeaderView(content: .sampleJumpHeight),
                LineChartHeaderView(content: .sampleBalanceLR),
                LineChartHeaderView(content: .sampleJump),
                LineChartHeaderView(content: .sampleRisk)
            ]
        )
        .frame(minWidth: 1_240, minHeight: 72)
    }
}
#endif
