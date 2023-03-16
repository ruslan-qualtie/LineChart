import Foundation

struct LineData: Identifiable {
    let name: String
    let style: LineStyle
    let points: [PointData]
    
    var id: String {
        name
    }
}

struct PointData {
    let value: Int
    var date: Date
}
