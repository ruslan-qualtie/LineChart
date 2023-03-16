import SwiftUI

struct LineView: View {
    let points: [CGPoint]
    let color: Color
    
    var body: some View {
        Path { path in
            path.addLines(points)
        }
        .stroke(color, lineWidth: 2)
    }
}
