import Foundation

public struct LongitudinalChartData: Codable {
    public let name: String
    public let data: [LongitudinalChartMetric]

    public init(name: String, data: [LongitudinalChartMetric]) {
        self.name = name
        self.data = data
    }
}

extension LongitudinalChartData: Equatable {}

extension LongitudinalChartData {
    func metricPoints() -> [MetricPoint] {
        var result: [MetricPoint] = []
        for entry in data {
            guard let metrics = entry.metrics else { continue }
            for metric in metrics {
                result.append(
                    .init(
                        metric: metric.key,
                        date: DateFormatter.iso8601.date(from: entry.scannedAt)!,
                        value: metric.value
                    )
                )
            }
        }
        return result
    }
    
    func headerContent() -> LineChartHeaderContent {
        LineChartName(rawValue: name)!.headerContent
    }
}
