import SwiftUI

struct LineLabelsView: View {
    let labels: [String]
    var body: some View {
        HStack(spacing: 0) {
            ForEach(labels, id: \.self) {
                Spacer()
                Text($0)
                    .font(.system(size: 12))
                    .foregroundColor(Color("geekblue3"))
                    .frame(width: 40, height: 20)
            }
        }
    }
}
