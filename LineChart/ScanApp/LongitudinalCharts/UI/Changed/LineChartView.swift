import Charts
import SwiftUI

struct LineChartView: View {
    private let chartData: LineChartData
    private let locale: Locale

    @State private var selectedDate: Date?
    @State private var isInteract = false

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
                    .locale(locale),
                verticalSpacing: 20
            )
            .foregroundStyle(Color.axisValueLabel)
        }
    }

    private var commonChartYAxisContent: some AxisContent {
        AxisMarks(
            position: .leading,
            values: .automatic(desiredCount: 5)
        ) {
            AxisGridLine(stroke: StrokeStyle(lineWidth: 1.0))
                .foregroundStyle(Color.axisGridLine)
            AxisValueLabel(horizontalSpacing: 8)
                .foregroundStyle(Color.axisValueLabel)
        }
    }

    @AxisContentBuilder
    private func customChartYAxisContent(labels: AxisLabels) -> some AxisContent {
        AxisMarks(
            position: .leading,
            values: labels.values
        ) {
            let value = $0.as(Double.self)!
            AxisValueLabel(horizontalSpacing: 8) {
                Text(labels.string(for: value))
            }
            .foregroundStyle(Color.axisValueLabel)
            AxisGridLine(stroke: StrokeStyle(lineWidth: 1.0))
                .foregroundStyle(Color.axisGridLine)
        }
    }

    @AxisContentBuilder
    private var chartYAxisContent: some AxisContent {
        if let yAxisLabels = chartData.yAxisLabels {
            customChartYAxisContent(labels: yAxisLabels)
        } else {
            commonChartYAxisContent
        }
    }

    // workaround for #coverage
    public init(chartData: LineChartData, locale: Locale = .current) {
        self.chartData = chartData
        self.locale = locale
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
                selectionRule
            }
            .chartForegroundStyleScale(range: chartForegroundStyleRange)
            .chartLegend(.hidden)
            .chartXAxis { chartXAxisContent }
            .chartYAxis { chartYAxisContent }
            .chartYScale(
                domain: .automatic(
                    includesZero: chartData.hasSinglePoint
                )
            )
            .chartOverlay { chart in
                GeometryReader { geo in
                    Rectangle().fill(.clear).contentShape(Rectangle())
                    #if os(macOS)
                        .onContinuousHover { phase in
                            switch phase {
                            case .active(let loc):
                                setSelectionBy(
                                    loc: loc,
                                    geo: geo,
                                    chart: chart
                                )
                            case .ended:
                                endInteraction()
                            }
                        }
                    #elseif os(iOS)
                        .simultaneousGesture(
                            DragGesture(minimumDistance: 0)
                                .onEnded { _ in
                                    endInteraction()
                                }
                                .onChanged { value in
                                    setSelectionBy(
                                        loc: value.location,
                                        geo: geo,
                                        chart: chart
                                    )
                                },
                            including: .gesture
                        )
                    #endif
                }
            }
        }
    }
    
    @ChartContentBuilder
    private var selectionRule: some ChartContent {
        if showSelectionRule {
            RuleMark(x: .value("Selected Date", selectedDate!))
            .foregroundStyle(Color.axisValueLabel)
            .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
        }
    }
    
    private var showSelectionRule: Bool {
        isInteract && selectedDate != nil
    }
    
    private func endInteraction() {
        isInteract = false
        selectedDate = nil
    }
    
    private func setSelectionBy(loc: CGPoint, geo: GeometryProxy, chart: ChartProxy) {
        let frame = geo[chart.plotAreaFrame]
        guard frame.contains(loc) else {
            endInteraction()
            return
        }
        isInteract = true
        let locationX = loc.x - frame.origin.x
        selectedDate = chart.value(atX: locationX, as: (Date).self)!
    }
}

#if DEBUG
public struct LineChartView_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer(
            [
                LineChartView(
                    chartData: .sampleChartJumpHeight,
                    locale: Locale(identifier: "en_US")
                )
                .padding(),
                LineChartView(
                    chartData: .sampleChartBalanceLR,
                    locale: Locale(identifier: "en_US")
                )
                .padding(),
                LineChartView(
                    chartData: .sampleChartJump,
                    locale: Locale(identifier: "en_US")
                )
                .padding(),
                LineChartView(
                    chartData: .sampleInjuryRisk,
                    locale: Locale(identifier: "en_US")
                )
                .padding()
            ],
            itemSize: .init(width: 1_000, height: 376))
    }
}

public struct LineChartViewOnePoint_Previews: PreviewProvider {
    public static var previews: some View {
        PreviewContainer(
            [
                LineChartView(
                    chartData: .sampleChartJumpHeightOnePoint,
                    locale: Locale(identifier: "en_US")
                )
                .padding(),
                LineChartView(
                    chartData: .sampleChartBalanceLROnePoint,
                    locale: Locale(identifier: "en_US")
                )
                .padding(),
                LineChartView(
                    chartData: .sampleChartJumpOnePoint,
                    locale: Locale(identifier: "en_US")
                )
                .padding(),
                LineChartView(
                    chartData: .sampleInjuryRiskOnePoint,
                    locale: Locale(identifier: "en_US")
                )
                .padding()
            ],
            itemSize: .init(width: 1_000, height: 376))
    }
}
#endif
