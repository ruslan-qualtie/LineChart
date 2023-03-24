import SwiftUI
import Charts

struct SwiftUILineChart: View {
    let dataSource: LineChartData
    let dateFormatter = DateFormatter()
    @State private var isDragging = false
    @State private var isHovering = false
    @State private var isSwappped = false
    @State private var selectedDate: Date
    @State private var selectedDateString: String
    @State private var selectedValue: Int
    @State private var selectedPoints: [LinePoint] = []
    
    let chartSymbolMap: KeyValuePairs<String, any ChartSymbolShape> = [
        "Drive": .triangle,
        "Load": .circle,
        "Explode": .square
    ]
    
    let chartSymbolSizeScale: KeyValuePairs<String, CGFloat> = [
        "Drive" : 64,
        "Load" : 64,
        "Explode" : 64
    ]

    let chartForegroundStyleMap: KeyValuePairs<String, Color> = [
        "Drive": .thirdLine,
        "Load": .firstLine,
        "Explode": .secondLine,
        "Average for Age": .white,
        "Search Rule": .axisValueLabel
    ]
    
    let chartLineStyleMap: KeyValuePairs<String, StrokeStyle> = [
        "Drive": .init(lineWidth: 2),
        "Load": .init(lineWidth: 2),
        "Explode": .init(lineWidth: 2),
        "Average for Age": .init(lineWidth: 2, dash: [5]),
        "Search Rule": .init(lineWidth: 1)
    ]

    var body: some View {
        Chart {
            RuleMark(
                xStart: .value("Date", dataSource.lines.first!.points.first!.date),
                xEnd: .value("Date", dataSource.lines.first!.points.last!.date),
                y: .value("Value", 39)
            )
            .foregroundStyle(by: .value("Line", "Average for Age"))
            .lineStyle(by: .value("Line", "Average for Age"))
            ForEach(dataSource.lines) { line in
                ForEach(line.points, id: \.date) { point in
                    LineMark(
                        x: .value("Date", point.date),
                        y: .value("Value", point.value)
                    )
                }
                .symbol(by: .value("Line", line.name))
                .symbolSize(by: .value("Line", line.name))
                .foregroundStyle(by: .value("Line", line.name))
                .lineStyle(by: .value("Line", line.name))
                // .interpolationMethod(.catmullRom)
            }
            if isDragging {
                RuleMark(
                    xStart: .value("Date", dataSource.lines.first!.points.first!.date),
                    xEnd: .value("Date", dataSource.lines.first!.points.last!.date),
                    y: .value("Value", selectedValue)
                )
                .foregroundStyle(by: .value("Line", "Search Rule"))
                .lineStyle(by: .value("Line", "Search Rule"))
                RuleMark(
                    x: .value("Date", selectedDate),
                    yStart: .value("Value", 0),
                    yEnd: .value("Value", 80)
                )
                .foregroundStyle(by: .value("Line", "Search Rule"))
                .lineStyle(by: .value("Line", "Search Rule"))
                .annotation(
                    position: isSwappped ? .leading : .trailing,
                    alignment: .topLeading,
                    spacing: 8
                ) {
                    VStack(alignment: .leading) {
                        Text("DATE: \(selectedDateString)")
                        Text("VALUE: \(selectedValue)")
                    }
                    .padding()
                    .foregroundColor(.axisValueLabel)
                    .background(Color.pageBackground)
                }
                PointMark(
                    x: .value("Date", selectedDate),
                    y: .value("Value", selectedValue)
                )
                .symbol(.cross)
                .foregroundStyle(Color.red)
            } else if isHovering {
                RuleMark(
                    x: .value("Date", selectedDate),
                    yStart: .value("Value", 0),
                    yEnd: .value("Value", 80)
                )
                .foregroundStyle(by: .value("Line", "Search Rule"))
                .lineStyle(by: .value("Line", "Search Rule"))
                .annotation(
                    position: isSwappped ? .leading : .trailing,
                    alignment: .topLeading,
                    spacing: 8
                ) {
                    VStack(alignment: .leading) {
                        ForEach(selectedPoints, id: \.line) { linePoint in
                            Text("\(linePoint.line): \(linePoint.value)")
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
        .chartSymbolScale(chartSymbolMap)
        .chartSymbolSizeScale(chartSymbolSizeScale)
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
                values: stride(from: 0, through: 80, by: 20).map { $0 }
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
                                isHovering = true
                            }
                            .onChanged { value in
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
                                isSwappped = location.x >= proxy.plotAreaSize.width / 2.0
                                let (date, value) = proxy.value(at: location, as: (Date, Double).self)!
                                selectedDate = date
                                selectedValue = Int(round(value))
                                dateFormatter.dateFormat = "MM/dd/YY, h:mm a"
                                selectedDateString = dateFormatter.string(from: date)
                                print("Location: \(date), \(value)")
                            }
                    )
                    .onContinuousHover { hoverPhase in
                        withAnimation {
                            if isDragging {
                                isHovering = false
                                return
                            }
                            switch hoverPhase {
                            case .active(let hoverLocation):
                                let frame = geometry[proxy.plotAreaFrame]
                                
                                guard frame.contains(hoverLocation) else {
                                    isHovering = false
                                    return
                                }
                                isHovering = true
                                let (date, value) = proxy.value(at: hoverLocation, as: (Date, Double).self)!
                                if let neareetDate = findNearestDate(in: dataSource, by: date), neareetDate != selectedDate {
                                    selectedDate = neareetDate
                                    let positionX = proxy.position(forX: neareetDate)!
                                    isSwappped = positionX >= proxy.plotAreaSize.width / 2.0
                                    dateFormatter.dateFormat = "MM/dd/YY, h:mm a"
                                    selectedDateString = dateFormatter.string(from: selectedDate)
                                    selectedPoints = findPoints(in: dataSource, by: neareetDate)
                                }
                                selectedValue = Int(round(value))
                                print("Location: \(date), \(value)")
                            case .ended:
                                isHovering = false
                            }
                        }
                    }
            }
        }
    }
    
    init(dataSource data: LineChartData) {
        let points = data.lines.map { LinePoint(line: $0.name, point: $0.points.first!) }
        dataSource = data
        _selectedDate = State(initialValue: points.first!.point.date)
        _selectedDateString = State(initialValue: "")
        _selectedValue = State(initialValue: 0)
        _selectedPoints = State(initialValue: points)
    }
}

extension SwiftUILineChart {
    func findNearestDate(in data: LineChartData, by selectedDate: Date) -> Date? {
        let dates = data.lines
            .flatMap(\.points)
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
    
    func findPoints(in data: LineChartData, by selectedDate: Date) -> [LinePoint] {
        var result = [LinePoint]()
        for line in data.lines {
            for point in line.points {
                if point.date == selectedDate {
                    result.append(LinePoint(line: line.name, point: point))
                    break
                }
            }
        }
        return result
    }
}

struct LinePoint {
    let line: String
    let point: PointData
}

extension LinePoint {
    var value: Int {
        Int(point.value)
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
