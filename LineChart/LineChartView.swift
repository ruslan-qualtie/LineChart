import SwiftUI
import Charts

struct LineChartView: View {
    let points: [MetricPoint]
    let dateFormatter = DateFormatter()
    @State private var isDragging = false
    // @State private var isHovering = false
    @State private var isSwappped = false
    @State private var selectedDate: Date
    @State private var selectedDateString: String
    @State private var selectedValue: Int
    @State private var selectedPoints: [MetricPoint] = []
    
    let chartSymbolMap: KeyValuePairs<String, any ChartSymbolShape> = [
        "Sparta Score": .circle,
        "Explode" : .circle,
        "Load" : .square,
        "Drive" : .triangle,
        "Left": .circle,
        "Right" : .square
    ]

    let chartForegroundStyleMap: KeyValuePairs<String, Color> = [
        "Sparta Score": .firstLine,
        "Explode" : .firstLine,
        "Load" : .secondLine,
        "Drive" : .thirdLine,
        "Left": .firstLine,
        "Right" : .secondLine,
        "Average for Age": .white,
        "Search Rule": .axisValueLabel
    ]
    
    let chartLineStyleMap: KeyValuePairs<String, StrokeStyle> = [
        "Average for Age": .init(lineWidth: 2, dash: [5]),
        "Search Rule": .init(lineWidth: 1)
    ]
    
    init(points: [MetricPoint]) {
        self.points = points
        _selectedDate = State(initialValue: points.first!.date)
        _selectedDateString = State(initialValue: "")
        _selectedValue = State(initialValue: 0)
        _selectedPoints = State(initialValue: points)
    }
    
    var body: some View {
        Chart {
            RuleMark(
                xStart: .value("Date", points.first!.date),
                xEnd: .value("Date", points.last!.date),
                y: .value("Value", 39)
            )
            .foregroundStyle(by: .value("Line", "Average for Age"))
            .lineStyle(by: .value("Line", "Average for Age"))
            ForEach(points) { point in
                LineMark(x: .value("Date", point.date), y: .value("Value", point.value))
                    .symbol(by: .value("Metric", point.metric))
                    .symbolSize(CGSize(width: 8, height: 8))
                    .foregroundStyle(by: .value("Metric", point.metric))
                    .lineStyle(StrokeStyle(lineWidth: 2))
            }
            if isDragging {
                RuleMark(
                    x: .value("Date", selectedDate),
                    yStart: .value("Value", 0),
                    yEnd: .value("Value", 100)
                )
                .foregroundStyle(by: .value("Line", "Search Rule"))
                .lineStyle(by: .value("Line", "Search Rule"))
                .annotation(
                    position: isSwappped ? .leading : .trailing,
                    alignment: .topLeading,
                    spacing: 8
                ) {
                    VStack(alignment: .leading) {
                        ForEach(selectedPoints) { selectedPoint in
                            Text("\(selectedPoint.metric): \(Int(selectedPoint.value))")
                        }
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .frame(height: 1)
                            .padding(.horizontal, 4)
                            .foregroundColor(.axisValueLabel)
                        Text("\(selectedDateString)")
                    }
                    .padding()
                    .foregroundColor(.axisValueLabel)
                    .background(Color.pageBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .circular))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8.0, style: .circular)
                            .stroke(Color.axisValueLabel, lineWidth: 1)
                    )
                }
            }
        }
        .chartForegroundStyleScale(chartForegroundStyleMap)
        .chartLineStyleScale(chartLineStyleMap)
        .chartXAxis {
            AxisMarks(values: .stride(by: .weekOfYear)) { value in
                AxisValueLabel(
                    format: .dateTime
                        .day(.twoDigits)
                        .month(.defaultDigits)
                        .locale(Locale(identifier: "en_US"))
                )
                .foregroundStyle(Color.axisValueLabel)
            }
        }
        .chartYAxis {
            AxisMarks(
                preset: .aligned,
                position: .leading,
                values: stride(from: 0, through: 100, by: 20).map { $0 }
            ) {
                AxisGridLine(stroke: StrokeStyle(lineWidth: 1.0))
                    .foregroundStyle(Color.axisGridLine)
                AxisValueLabel()
                    .foregroundStyle(Color.axisValueLabel)
            }
        }
        .chartLegend(position: .automatic, alignment: .leading, spacing: 8) {
            HStack {
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 25, height: 2)
                    .foregroundColor(.white)
                Text("Average for Age")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
        }
        .chartOverlay { proxy in
            GeometryReader { geometry in
                Rectangle().fill(.clear).contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .onEnded { _ in
                                isDragging = false
                            }
                            .onChanged { value in
                                withAnimation {
                                    let frame = geometry[proxy.plotAreaFrame]
                                    let location = CGPoint(
                                        x: value.location.x - frame.origin.x,
                                        y: value.location.y - frame.origin.y
                                    )
                                    guard frame.contains(location) else {
                                        isDragging = false
                                        return
                                    }
                                    isDragging = true
                                    let (date, value) = proxy.value(at: location, as: (Date, Double).self)!
                                    if let neareetDate = findNearestDate(in: points, by: date), neareetDate != selectedDate {
                                        selectedDate = neareetDate
                                        let positionX = proxy.position(forX: neareetDate)!
                                        isSwappped = positionX >= proxy.plotAreaSize.width / 2.0
                                        dateFormatter.dateFormat = "MM/dd/YY, h:mm a"
                                        selectedDateString = dateFormatter.string(from: selectedDate)
                                        selectedPoints = findPoints(in: points, by: neareetDate)
                                    }
                                    selectedValue = Int(round(value))
                                    print("Location: \(date), \(value)")
                                }
                            }
                    )

            }
        }
        .frame(minHeight: 376)
    }
}

extension LineChartView {
    func findNearestDate(in points: [MetricPoint], by selectedDate: Date) -> Date? {
        let dates = points
            .map(\.date)
            .reduce([Date](), { $0.contains($1) ? $0 : $0 + [$1] })
        var minDistance: TimeInterval = .infinity
        var result: Date? = nil
        for date in dates {
            let distance = abs(date.distance(to: selectedDate))
            if distance < minDistance {
                minDistance = distance
                result = date
            }
        }
        return result
    }
    
    func findPoints(in points: [MetricPoint], by selectedDate: Date) -> [MetricPoint] {
        var result = [MetricPoint]()
        for point in points {
            if point.date == selectedDate {
                result.append(point)
            }
        }
        return result
    }
}
