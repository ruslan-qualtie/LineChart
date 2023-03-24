import Charts
import Foundation

struct PointData {
    let date: Date
    let value: Double
}

extension PointData {
    var plottableDate: PlottableValue<Date> {
        .value("Date", date)
    }

    var plottableValue: PlottableValue<Double> {
        .value("Value", value)
    }
}
