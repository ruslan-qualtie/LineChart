public enum DeltaSignificantChange: Int, Equatable {
    case negativeLarge = -2
    case negativeModerate = -1
    case positiveModerate = 1
    case positiveLarge = 2
}

public struct ResultDelta {
    public let delta: Float
    public let significantChange: DeltaSignificantChange?

    public init(delta: Float, significantChange: DeltaSignificantChange? = nil) {
        self.delta = delta
        self.significantChange = significantChange
    }
}

extension ResultDelta: Equatable {}
