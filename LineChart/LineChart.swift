import SwiftUI

struct LineChart: View {
    let dataSource: LineChartData
    
    let gridValues: [Int]
    let labels: [String]
    let gridSize: CGFloat
    let datesRange: TimeInterval
    let startDate: Date

    private let gridOffset: CGFloat = 7
    
    init(dataSource: LineChartData) {
        self.dataSource = dataSource
        self.gridValues = [-10, 10, 30, 50, 70]
        self.labels = ["11/21", "12/02", "12/14", "12/25", "1/06", "1/18", "1/29"]
        
        let calcs = LineChartCalcs(
            gridValues: gridValues,
            dates: dataSource.lines.first!.points.map(\.date)
        )
        self.gridSize = calcs.gridSize
        self.datesRange = calcs.datesRange
        self.startDate = calcs.startDate
    }
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                LineGridView(gridValues: gridValues)
                    .offset(y: gridOffset)
                GeometryReader { geometry in
                    let scale = scale(with: geometry.size)
                    ForEach(dataSource.lines) { line in
                        let points = points(for: line.points, scale: scale, height: geometry.size.height)
                        LineView(
                            points: points,
                            color: Color(line.style.colorName)
                        )
                        DotsView(points: points, color: Color(line.style.colorName), style: line.style.dotStyle)
                    }
                }
            }
            LineLabelsView(labels: labels)
        }
    }
    
    private func points(for line: [PointData], scale: CGPoint, height: CGFloat) -> [CGPoint] {
        line.map { point in
            return  CGPoint(
                x: point.date.timeIntervalSince(startDate) * scale.x,
                y: height - CGFloat(point.value - gridValues.first!) * scale.y
            )
        }
    }
    
    private func scale(with size: CGSize) -> CGPoint {
        CGPoint(
            x: size.width / datesRange,
            y: (size.height - 2 * gridOffset) / gridSize
        )
    }
}

public struct LineChartCalcs {
    let gridValues: [Int]
    let dates: [Date]
    
    var gridSize: CGFloat {
        CGFloat(gridValues.last! - gridValues.first!)
    }
    
    var startDate: Date {
        dates.first!
    }
    
    var datesRange: TimeInterval {
        dates.last!.timeIntervalSince(dates.first!)
    }
}
