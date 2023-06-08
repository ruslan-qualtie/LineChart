import Foundation

extension LineData {
    static var sampleLineJumpHeight: LineData {
        .init(
            points:
                [
                    .init(date: .date(from: "2023-01-01T00:00:00"), value: 13),
                    .init(date: .date(from: "2023-01-03T00:00:00"), value: 12),
                    .init(date: .date(from: "2023-01-04T00:00:00"), value: 13),
                    .init(date: .date(from: "2023-01-26T00:00:00"), value: 12),
                    .init(date: .date(from: "2023-01-27T00:00:00"), value: 13),
                    .init(date: .date(from: "2023-01-28T00:00:00"), value: 12),
                    .init(date: .date(from: "2023-01-29T00:00:00"), value: 13),
                    .init(date: .date(from: "2023-01-30T00:00:00"), value: 14),
                    .init(date: .date(from: "2023-01-31T00:00:00"), value: 12),
                    .init(date: .date(from: "2023-02-06T00:00:00"), value: 14),
                    .init(date: .date(from: "2023-02-08T00:00:00"), value: 12),
                    .init(date: .date(from: "2023-02-12T00:00:00"), value: 14),
                    .init(date: .date(from: "2023-02-16T00:00:00"), value: 12),
                    .init(date: .date(from: "2023-02-22T00:00:00"), value: 9),
                    .init(date: .date(from: "2023-02-23T00:00:00"), value: 11),
                    .init(date: .date(from: "2023-02-26T00:00:00"), value: 6)
                ],
            name: "Jump Height"
        )
    }

    static var sampleLineBalanceLeft: LineData {
        .init(
            points:
                [
                    .init(date: .date(from: "2023-01-01T00:00:00"), value: 70),
                    .init(date: .date(from: "2023-01-03T00:00:00"), value: 67),
                    .init(date: .date(from: "2023-01-04T00:00:00"), value: 70),
                    .init(date: .date(from: "2023-01-26T00:00:00"), value: 67),
                    .init(date: .date(from: "2023-01-27T00:00:00"), value: 72),
                    .init(date: .date(from: "2023-01-28T00:00:00"), value: 68),
                    .init(date: .date(from: "2023-01-29T00:00:00"), value: 70),
                    .init(date: .date(from: "2023-01-30T00:00:00"), value: 74),
                    .init(date: .date(from: "2023-01-31T00:00:00"), value: 67),
                    .init(date: .date(from: "2023-02-06T00:00:00"), value: 76),
                    .init(date: .date(from: "2023-02-08T00:00:00"), value: 67),
                    .init(date: .date(from: "2023-02-12T00:00:00"), value: 75),
                    .init(date: .date(from: "2023-02-16T00:00:00"), value: 66),
                    .init(date: .date(from: "2023-02-22T00:00:00"), value: 54),
                    .init(date: .date(from: "2023-02-23T00:00:00"), value: 63),
                    .init(date: .date(from: "2023-02-26T00:00:00"), value: 44)
                ],
            name: "Left"
        )
    }

    static var sampleLineBalanceRight: LineData {
        .init(
            points:
                [
                    .init(date: .date(from: "2023-01-01T00:00:00"), value: 67),
                    .init(date: .date(from: "2023-01-03T00:00:00"), value: 65),
                    .init(date: .date(from: "2023-01-04T00:00:00"), value: 69),
                    .init(date: .date(from: "2023-01-26T00:00:00"), value: 68),
                    .init(date: .date(from: "2023-01-27T00:00:00"), value: 74),
                    .init(date: .date(from: "2023-01-28T00:00:00"), value: 65),
                    .init(date: .date(from: "2023-01-29T00:00:00"), value: 71),
                    .init(date: .date(from: "2023-01-30T00:00:00"), value: 72),
                    .init(date: .date(from: "2023-01-31T00:00:00"), value: 66),
                    .init(date: .date(from: "2023-02-06T00:00:00"), value: 59),
                    .init(date: .date(from: "2023-02-08T00:00:00"), value: 66),
                    .init(date: .date(from: "2023-02-12T00:00:00"), value: 75),
                    .init(date: .date(from: "2023-02-16T00:00:00"), value: 64),
                    .init(date: .date(from: "2023-02-22T00:00:00"), value: 53),
                    .init(date: .date(from: "2023-02-23T00:00:00"), value: 61),
                    .init(date: .date(from: "2023-02-26T00:00:00"), value: 64)
                ],
            name: "Right"
        )
    }

    static var sampleLineJumpLoad: LineData {
        .init(
            points:
                [
                    .init(date: .date(from: "2023-01-01T00:00:00"), value: 50),
                    .init(date: .date(from: "2023-01-03T00:00:00"), value: 47),
                    .init(date: .date(from: "2023-01-04T00:00:00"), value: 50),
                    .init(date: .date(from: "2023-01-26T00:00:00"), value: 47),
                    .init(date: .date(from: "2023-01-27T00:00:00"), value: 52),
                    .init(date: .date(from: "2023-01-28T00:00:00"), value: 48),
                    .init(date: .date(from: "2023-01-29T00:00:00"), value: 50),
                    .init(date: .date(from: "2023-01-30T00:00:00"), value: 54),
                    .init(date: .date(from: "2023-01-31T00:00:00"), value: 47),
                    .init(date: .date(from: "2023-02-06T00:00:00"), value: 55),
                    .init(date: .date(from: "2023-02-08T00:00:00"), value: 47),
                    .init(date: .date(from: "2023-02-12T00:00:00"), value: 55),
                    .init(date: .date(from: "2023-02-16T00:00:00"), value: 46),
                    .init(date: .date(from: "2023-02-22T00:00:00"), value: 34),
                    .init(date: .date(from: "2023-02-23T00:00:00"), value: 43),
                    .init(date: .date(from: "2023-02-26T00:00:00"), value: 24)
                ],
            name: "Load"
        )
    }

    static var sampleLineJumpExpload: LineData {
        .init(
            points:
                [
                    .init(date: .date(from: "2023-01-01T00:00:00"), value: 47),
                    .init(date: .date(from: "2023-01-03T00:00:00"), value: 45),
                    .init(date: .date(from: "2023-01-04T00:00:00"), value: 49),
                    .init(date: .date(from: "2023-01-26T00:00:00"), value: 48),
                    .init(date: .date(from: "2023-01-27T00:00:00"), value: 54),
                    .init(date: .date(from: "2023-01-28T00:00:00"), value: 45),
                    .init(date: .date(from: "2023-01-29T00:00:00"), value: 51),
                    .init(date: .date(from: "2023-01-30T00:00:00"), value: 52),
                    .init(date: .date(from: "2023-01-31T00:00:00"), value: 46),
                    .init(date: .date(from: "2023-02-06T00:00:00"), value: 39),
                    .init(date: .date(from: "2023-02-08T00:00:00"), value: 46),
                    .init(date: .date(from: "2023-02-12T00:00:00"), value: 55),
                    .init(date: .date(from: "2023-02-16T00:00:00"), value: 44),
                    .init(date: .date(from: "2023-02-22T00:00:00"), value: 33),
                    .init(date: .date(from: "2023-02-23T00:00:00"), value: 41),
                    .init(date: .date(from: "2023-02-26T00:00:00"), value: 44)
                ],
            name: "Expload"
        )
    }

    static var sampleLineJumpDrive: LineData {
        .init(
            points:
                [
                    .init(date: .date(from: "2023-01-01T00:00:00"), value: 44),
                    .init(date: .date(from: "2023-01-03T00:00:00"), value: 43),
                    .init(date: .date(from: "2023-01-04T00:00:00"), value: 48),
                    .init(date: .date(from: "2023-01-26T00:00:00"), value: 49),
                    .init(date: .date(from: "2023-01-27T00:00:00"), value: 56),
                    .init(date: .date(from: "2023-01-28T00:00:00"), value: 42),
                    .init(date: .date(from: "2023-01-29T00:00:00"), value: 52),
                    .init(date: .date(from: "2023-01-30T00:00:00"), value: 50),
                    .init(date: .date(from: "2023-01-31T00:00:00"), value: 45),
                    .init(date: .date(from: "2023-02-06T00:00:00"), value: 53),
                    .init(date: .date(from: "2023-02-08T00:00:00"), value: 44),
                    .init(date: .date(from: "2023-02-12T00:00:00"), value: 53),
                    .init(date: .date(from: "2023-02-16T00:00:00"), value: 46),
                    .init(date: .date(from: "2023-02-22T00:00:00"), value: 35),
                    .init(date: .date(from: "2023-02-23T00:00:00"), value: 41),
                    .init(date: .date(from: "2023-02-26T00:00:00"), value: 42)
                ],
            name: "Drive"
        )
    }
}

fileprivate extension DateFormatter {
    static var iso8601WithoutTimeZone: DateFormatter {
        Init(DateFormatter()) {
            $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        }
    }
}

fileprivate extension Date {
    static func date(from string: String) -> Date {
        DateFormatter.iso8601WithoutTimeZone.date(from: string)!
    }
}
