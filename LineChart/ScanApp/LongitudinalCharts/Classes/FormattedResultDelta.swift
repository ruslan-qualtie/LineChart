import Foundation

public struct FormattedResultDelta {
    public let value: String
    public let side: DeltaSide
    public let change: DeltaChange
    public let significantChange: DeltaSignificantChange?

    public init(value: String, side: DeltaSide, change: DeltaChange, significantChange: DeltaSignificantChange? = nil) {
        self.value = value
        self.side = side
        self.change = change
        self.significantChange = significantChange
    }
}

extension FormattedResultDelta: Equatable {}
