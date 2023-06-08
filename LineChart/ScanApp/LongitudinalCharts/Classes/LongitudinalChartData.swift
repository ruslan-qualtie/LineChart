import Foundation

public struct LongitudinalChartData {
    public let data: LineChartData
    public let header: LineChartHeaderContent

    public init(data: LineChartData, header: LineChartHeaderContent) {
        self.data = data
        self.header = header
    }
}

extension LongitudinalChartData: Equatable {}
