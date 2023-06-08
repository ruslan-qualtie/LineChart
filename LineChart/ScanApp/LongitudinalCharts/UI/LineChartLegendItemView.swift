import Charts
import SwiftUI

struct LineChartLegendItemView: View {
    private let index: Int
    private let title: String

    private let symbols: [BasicChartSymbolShape] = [
        .circle,
        .square,
        .triangle
    ]

    private let colors: [Color] = [
        .firstLine,
        .secondLine,
        .thirdLine
    ]

    // workaround for #coverage
    public init(index: Int, title: String) {
        self.index = index
        self.title = title
    }

    var body: some View {
        HStack {
            symbols[index]
                .strokeBorder(lineWidth: 2)
                .foregroundColor(colors[index])
                .frame(width: 13, height: 13)
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(.axisValueLabel)
        }
    }
}

#if DEBUG
public struct LineChartLegendItemView_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer(
            [
                LineChartLegendItemView(index: 0, title: "Load"),
                LineChartLegendItemView(index: 1, title: "Explode"),
                LineChartLegendItemView(index: 2, title: "Drive"),
                LineChartLegendItemView(index: 0, title: "Left"),
                LineChartLegendItemView(index: 1, title: "Right")
            ]
        )
    }
}
#endif
