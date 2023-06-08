import Foundation

public extension Data {
    var asciiString: String {
        String(data: self, encoding: .ascii)!
    }
}
