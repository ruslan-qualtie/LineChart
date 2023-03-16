import Foundation

extension Date {
    public static func date(year: Int, month: Int = 1, day: Int = 1) -> Date {
        Calendar.current.date(from: DateComponents(year: year, month: month, day: day))!
    }
}
