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
                        .sampleBalanceLR
                    ]
                )
                .frame(width: 1_240)
                .background(Color("background"))
            }
        }
    }
}
