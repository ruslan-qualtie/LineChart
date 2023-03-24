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

//extension Array where Element == LineChartPoint {
//    func findNearestDate(by date: Date) -> Date {
//        let dates = map(\.date).reduce([Date](), { $0.contains($1) ? $0 : $0 + [$1] })
//        var minDistance: TimeInterval = .infinity
//        var result: Date? = nil
//        dates.forEach {
//            let distance = abs(date.distance(to: $0))
//            if distance < minDistance {
//                minDistance = distance
//                result = date
//            }
//        }
//        return result ?? date
//    }
//    
//    func findPoints(by date: Date) -> [LineChartPoint] {
//        var result = [LineChartPoint]()
//        for point in self {
//            if point.date == date {
//                result.append(point)
//            }
//        }
//        return result
//    }
//}
