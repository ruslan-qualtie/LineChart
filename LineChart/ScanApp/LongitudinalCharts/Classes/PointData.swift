import Charts
import Foundation

public struct PointData {
    public let date: Date
    public let value: Double

    public init(date: Date, value: Double) {
        self.date = date
        self.value = value
    }
}

extension PointData: Equatable {}

extension PointData: Hashable {}
