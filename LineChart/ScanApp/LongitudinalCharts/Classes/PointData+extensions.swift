import Charts
import Foundation

extension PointData {
    public var plottableDate: PlottableValue<Date> {
        .value("Date", date)
    }

    public var plottableValue: PlottableValue<Double> {
        .value("Value", value)
    }
}
