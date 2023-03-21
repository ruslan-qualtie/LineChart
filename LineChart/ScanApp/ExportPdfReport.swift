public struct ExportPdfReport: Codable {
    public let longitudinalCharts: [LongitudinalChartData]

    public init(longitudinalCharts: [LongitudinalChartData]) {
        self.longitudinalCharts = longitudinalCharts
    }
}

extension ExportPdfReport: Equatable {}
