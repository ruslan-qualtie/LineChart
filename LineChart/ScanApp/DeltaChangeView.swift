import SwiftUI

struct DeltaChangeView: View {
    let significantChange: DeltaSignificantChange

    private var imageName: String {
        switch significantChange {
        case .negativeLarge:
            return "down-arrow-double"
        case .negativeModerate:
            return "down-arrow-single"
        case .positiveModerate:
            return "up-arrow-single"
        case .positiveLarge:
            return "up-arrow-double"
        }
    }

    private var tooltip: String {
        switch significantChange {
        case .negativeLarge, .positiveLarge:
            return """
                    Large Change from Baseline
                     (Greater than 20% change)
                    """
        case .negativeModerate, .positiveModerate:
            return """
                    Moderate Change from Baseline
                         (Greater than 10% change)
                    """
        }
    }

    var body: some View {
        Image(imageName)
            .help(tooltip)
    }
}

#if DEBUG
public struct DeltaChangeView_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer([
            DeltaChangeView(significantChange: .negativeLarge),
            DeltaChangeView(significantChange: .negativeModerate),
            DeltaChangeView(significantChange: .positiveModerate),
            DeltaChangeView(significantChange: .positiveLarge)
        ])
    }
}
#endif
