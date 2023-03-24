import Charts
import Foundation

struct LineData {
    let points: [PointData]
    let name: String
}

extension LineData: Identifiable {
    var id: String {
        name
    }
}

extension LineData {
    var plottableName: PlottableValue<String> {
        .value("Name", name)
    }
}
