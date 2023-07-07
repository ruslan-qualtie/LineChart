public struct AxisLabels {
    private let axisLabels: [Double: String]

    public init(_ axisLabels: [Double: String]) {
        self.axisLabels = axisLabels
    }
}

extension AxisLabels {
    public var values: [Double] {
        axisLabels.keys.sorted()
    }

    public func string(for value: Double) -> String {
        axisLabels[value] ?? ""
    }
}

extension AxisLabels: Equatable {
    public static func == (lhs: AxisLabels, rhs: AxisLabels) -> Bool {
        lhs.axisLabels == rhs.axisLabels
    }
}
