import Foundation

public struct FormattedResultDelta {
    public let value: String
    public let significantChange: DeltaSignificantChange?

    public init(value: String, significantChange: DeltaSignificantChange? = nil) {
        self.value = value
        self.significantChange = significantChange
    }
}

extension FormattedResultDelta: Equatable {}
