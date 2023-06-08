import SwiftUI

extension String {
    var systemIconName: String? {
        hasPrefix(.iconSign) ? replacingOccurrences(of: String.iconSign, with: "") : nil
    }
}
