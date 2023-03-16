struct LineChartData {
    let lines: [LineData]
}

let dataSouce = LineChartData(
    lines: [
        LineData(
            name: "Load",
            style: LineStyle(
                colorName: "line1",
                dotStyle: .circle
            ),
            points: [
                PointData(value: 44, date: .date(year: 2022, month: 11, day: 14)),
                PointData(value: 50, date: .date(year: 2022, month: 11, day: 22)),
                PointData(value: 56, date: .date(year: 2022, month: 12, day: 19)),
                PointData(value: 56, date: .date(year: 2023, month: 01, day: 11)),
                PointData(value: 53, date: .date(year: 2023, month: 01, day: 12)),
                PointData(value: 56, date: .date(year: 2023, month: 02, day: 03)),
            ]
        ),
        LineData(
            name: "Explode",
            style: LineStyle(
                colorName: "line2",
                dotStyle: .square
            ),
            points: [
                PointData(value: 39, date: .date(year: 2022, month: 11, day: 14)),
                PointData(value: 42, date: .date(year: 2022, month: 11, day: 22)),
                PointData(value: 47, date: .date(year: 2022, month: 12, day: 19)),
                PointData(value: 48, date: .date(year: 2023, month: 01, day: 11)),
                PointData(value: 47, date: .date(year: 2023, month: 01, day: 12)),
                PointData(value: 45, date: .date(year: 2023, month: 02, day: 03)),
            ]
        ),
        LineData(
            name: "Drive",
            style: LineStyle(
                colorName: "line3",
                dotStyle: .triangle
            ),
            points: [
                PointData(value: 22, date: .date(year: 2022, month: 11, day: 14)),
                PointData(value: 17, date: .date(year: 2022, month: 11, day: 22)),
                PointData(value: 41, date: .date(year: 2022, month: 12, day: 19)),
                PointData(value: 41, date: .date(year: 2023, month: 01, day: 11)),
                PointData(value: 41, date: .date(year: 2023, month: 01, day: 12)),
                PointData(value: 32, date: .date(year: 2023, month: 02, day: 03)),
            ]
        )
    ]
)

struct LineStyle {
    let colorName: String
    let dotStyle: DotStyle
}
