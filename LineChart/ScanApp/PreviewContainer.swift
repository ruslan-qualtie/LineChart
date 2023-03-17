import SwiftUI

struct PreviewContainer<Item: View>: View {
    let items: [Item]
    let itemSize: CGSize?
    let borderColor: Color

    init(_ items: [Item], itemSize: CGSize? = nil, borderColor: Color = .green) {
        self.items = items
        self.itemSize = itemSize
        self.borderColor = borderColor
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(items.indices, id: \.self) { index in
                Group {
                    if itemSize == nil {
                        items[index]
                    } else {
                        items[index]
                            .frame(width: itemSize!.width, height: itemSize!.height)
                    }
                }
                .padding(1)
                .border(borderColor)
            }
        }
    }
}
