import SwiftUI

struct DotsView: View {
    let points: [CGPoint]
    let color: Color
    let style: DotStyle
    
    var body: some View {
        ForEach(points, id:\.x) { point in
            ZStack {
                style
                    .shape(color: color)
                    .frame(width: 8, height: 8)
                style
                    .shape(color:Color("background"))
                    .frame(width: 4, height: 4)

            }
            .position(point)
        }
    }
}

enum DotStyle {
    case circle
    case square
    case triangle
}

extension DotStyle {

    @ViewBuilder
    func shape(color: Color) -> some View {
        switch self {
        case .circle:
            Circle()
                .fill(color)
        case .square:
            RoundedRectangle(cornerRadius: 2)
                .fill(color)
        case .triangle:
            Rectangle()
                .fill(color)
        }
    }
}

struct Triangle: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
    return path
  }
}
