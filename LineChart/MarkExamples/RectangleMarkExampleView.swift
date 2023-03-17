import SwiftUI
import Charts

struct RectangleMarkExampleView: View {
    struct Coord: Identifiable {
        var x: Double
        var y: Double
        let id = UUID()
    }
    
    var data1: [Coord] = [
        Coord(x: 5, y: 5),
        Coord(x: 2.5, y: 2.5),
        Coord(x: 3, y: 3)
    ]
    
    struct MatrixEntry: Identifiable {
        var positive: String
        var negative: String
        var num: Double
        let id = UUID()
    }
    
    var data2: [MatrixEntry] = [
        MatrixEntry(positive: "+", negative: "+", num: 125),
        MatrixEntry(positive: "+", negative: "-", num: 10),
        MatrixEntry(positive: "-", negative: "-", num: 80),
        MatrixEntry(positive: "-", negative: "+", num: 1)
    ]
    
    var body: some View {
        Chart(data1) {
            RectangleMark(
                xStart: .value("Rect Start Width", $0.x - 0.25),
                xEnd: .value("Rect End Width", $0.x + 0.25),
                yStart: .value("Rect Start Height", $0.y - 0.25),
                yEnd: .value("Rect End Height", $0.y + 0.25)
            )
            .opacity(0.2)
            
            PointMark(
                x: .value("X", $0.x),
                y: .value("Y", $0.y)
            )
        }
        .frame(height: 400)
        Chart(data2) {
            RectangleMark(
                x: .value("Positive", $0.positive),
                y: .value("Negative", $0.negative)
            )
            .foregroundStyle(by: .value("Number", $0.num))
        }
        .frame(height: 400)
    }
}
