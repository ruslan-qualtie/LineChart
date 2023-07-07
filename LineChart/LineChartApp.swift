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
                .padding(30)
                .background(Color("background"))
                #if os(macOS)
                .frame(minWidth: 1_240, minHeight: 800)
                #endif
            }
        }
    }
}
