import SwiftUI

extension View {
    @ViewBuilder func averageForAgeLegend(_ show: Bool) -> some View {
        if show {
            self.chartLegend(position: .automatic, alignment: .leading, spacing: 8) {
                HStack {
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .frame(width: 25, height: 2)
                    Text("Average for Age")
                        .font(.system(size: 12))
                }
                .foregroundColor(.white)
            }
        } else {
            self.chartLegend(.hidden)
        }
    }
}
