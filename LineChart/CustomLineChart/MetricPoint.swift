import Foundation
import Charts

struct MetricPoint: Identifiable {
    var metric: String
    var date: Date
    var value: Double
    let id = UUID()
    
    init(metric: String, date: Date, value: Double) {
        self.metric = metric
        self.date = date
        self.value = value
    }
}
