import Foundation

extension Date {
    public static func date(from string: String) -> Date {
        DateFormatter.iso8601.date(from: string)!
    }
}
