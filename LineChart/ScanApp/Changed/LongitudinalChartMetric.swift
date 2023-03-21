import Foundation

public struct LongitudinalChartMetric: Codable {
    public let scanId: String
    public let scannedAt: String
    public let metrics: [String: Double]?

    public init(scanId: String, scannedAt: String, metrics: [String: Double]) {
        self.scanId = scanId
        self.scannedAt = scannedAt
        self.metrics = metrics
    }
}

extension LongitudinalChartMetric: Equatable {}
