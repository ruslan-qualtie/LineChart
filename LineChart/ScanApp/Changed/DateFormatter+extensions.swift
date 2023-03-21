import Foundation

extension DateFormatter {
    public static var rfc3339: DateFormatter {
        Init(DateFormatter()) {
            $0.locale = Locale(identifier: "en_US_POSIX")
            $0.timeZone = TimeZone(secondsFromGMT: 0)
            $0.dateFormat = "EEE, dd MMM yyyy HH:mm:ss z"
        }
    }

    public static var usMonthDayYear: DateFormatter {
        Init(DateFormatter()) {
            $0.locale = Locale(identifier: "en_US")
            $0.dateFormat = "MM/dd/yyyy"
        }
    }

    public static var iso8601WithMilliseconds: DateFormatter {
        Init(DateFormatter()) {
            $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        }
    }
    
    public static var iso8601: DateFormatter {
        Init(DateFormatter()) {
            $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        }
    }
}
