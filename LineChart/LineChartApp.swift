import SwiftUI

@main
struct LineChartApp: App {
    var body: some Scene {
        WindowGroup {
            ScrollView {
                ResultsHistoryView(
                    longitudinalCharts: [
                        .sampleJumpHeight,
                        .sampleJump,
                        .sampleBalanceLR,
                        .sampleRisk
                    ]
                )
                .frame(width: 1_240)
                .padding(30)
                .background(Color("background"))
            }
        }
    }
}
