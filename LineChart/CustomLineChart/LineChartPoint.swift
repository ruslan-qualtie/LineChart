import Foundation
import Charts

public struct LineChartPoint: Identifiable {
    public let id = UUID()
    public var metric: String
    public var date: Date
    public var value: Double
    
    init(metric: String, date: Date, value: Double) {
        self.metric = metric
        self.date = date
        self.value = value
    }
}

extension LineChartPoint {
    var plottableMetric: PlottableValue<String> {
        .value("Metric", metric)
    }

    var plottableDate: PlottableValue<Date> {
        .value("Date", date)
    }

    var plottableValue: PlottableValue<Double> {
        .value("Value", value)
    }
}
