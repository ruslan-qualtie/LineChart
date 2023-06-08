import Charts
import Foundation

public struct LineData {
    public let points: [PointData]
    public let name: String

    public init(points: [PointData], name: String) {
        self.points = points
        self.name = name
    }
}

extension LineData: Identifiable {
    public var id: String {
        name
    }
}

extension LineData: Equatable {}
