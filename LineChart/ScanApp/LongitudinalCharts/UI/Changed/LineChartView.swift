import Charts
import SwiftUI

struct LineChartView: View {
    private let chartData: LineChartData

    private let chartForegroundStyleRange: [Color] = [
        .firstLine,
        .secondLine,
        .thirdLine
    ]

    private var chartXAxisContent: some AxisContent {
        AxisMarks(preset: .aligned) {
            AxisValueLabel(
                format: .dateTime
                    .day(.twoDigits)
                    .month(.twoDigits)
                    .locale(Locale(identifier: "en_US")),
                verticalSpacing: 20
            )
            .foregroundStyle(Color.axisValueLabel)
        }
    }

    private var commonChartYAxisContent: some AxisContent {
        AxisMarks(position: .leading) {
            AxisGridLine(stroke: StrokeStyle(lineWidth: 1.0))
                .foregroundStyle(Color.axisGridLine)
            AxisValueLabel(horizontalSpacing: 8)
                .foregroundStyle(Color.axisValueLabel)
        }
    }

    private var riskChartYAxisContent: some AxisContent {
        AxisMarks(
            position: .leading,
            values: InjuryRisk
                .allCases
                .map(\.rawValue)
        ) {
            AxisGridLine(stroke: StrokeStyle(lineWidth: 1.0))
                .foregroundStyle(Color.axisGridLine)
            
            AxisValueLabel(
                format: InjuryRiskFormatStyle(),
                horizontalSpacing: 8
            )
            .foregroundStyle(Color.axisValueLabel)

        }
    }
    
    @AxisContentBuilder
    private var chartYAxisContent: some AxisContent {
        if chartData.name == "Risk" {
            riskChartYAxisContent
        } else {
            commonChartYAxisContent
        }
    }

    // workaround for #coverage
    public init(chartData: LineChartData) {
        self.chartData = chartData
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Chart {
                ForEach(chartData.lines) { line in
                    ForEach(line.points, id: \.date) { point in
                        LineMark(x: point.plottableDate, y: point.plottableValue)
                    }
                    .symbol(by: line.plottableName)
                    .symbolSize(CGSize(width: 8, height: 8))
                    .foregroundStyle(by: line.plottableName)
                    .lineStyle(StrokeStyle(lineWidth: 2))
                }
            }
            .chartForegroundStyleScale(range: chartForegroundStyleRange)
            .chartLegend(.hidden)
            .chartXAxis { chartXAxisContent }
            .chartYAxis { chartYAxisContent }
        }
    }
}

#if DEBUG
public struct LineChartView_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer(
            [
                LineChartView(chartData: .sampleInjuryRisk)
                    .padding(),
                LineChartView(chartData: .sampleChartJumpHeight)
                    .padding(),
                LineChartView(chartData: .sampleChartBalanceLR)
                    .padding(),
                LineChartView(chartData: .sampleChartJump)
                    .padding()
            ],
            itemSize: .init(width: 1_000, height: 376))
    }
}
#endif
