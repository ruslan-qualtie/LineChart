import SwiftUI

struct LineGridView: View {
    let gridValues: [Int]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(gridValues.reversed(), id: \.self) { value in
                HStack(spacing: 8) {
                    Text("\(value)")
                        .frame(width: 20, alignment: .trailing)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(Color("geekblue3"))
                    Rectangle()
                        .fill(Color("gridLine"))
                        .frame(height: 1)
                }
                if value != gridValues.first { Spacer() }
            }
        }
    }
}
