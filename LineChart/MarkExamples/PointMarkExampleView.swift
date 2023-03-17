import SwiftUI
import Charts

struct PointMarkExampleView: View {
    struct Insect: Identifiable {
        let name: String
        let family: String
        let wingLength: Double
        let wingWidth: Double
        let weight: Double
        let id = UUID()
    }
    
    var data: [Insect] = [
        Insect(name: "Hepialidae", family: "Lepidoptera", wingLength: 61, wingWidth: 52, weight: 22),
        Insect(name: "Danaidae", family: "Lepidoptera", wingLength: 60, wingWidth: 48, weight: 24),
        Insect(name: "Riodinidae", family: "Lepidoptera", wingLength: 53, wingWidth: 43, weight: 18),
        
        Insect(name: "Hepialidae", family: "Humenoptera", wingLength: 48, wingWidth: 41, weight: 22),
        Insect(name: "Danaidae", family: "Humenoptera", wingLength: 47, wingWidth: 43, weight: 24),
        Insect(name: "Riodinidae", family: "Humenoptera", wingLength: 44, wingWidth: 38, weight: 18),
        
        Insect(name: "Hepialidae", family: "Diptera", wingLength: 30, wingWidth: 15, weight: 22),
        Insect(name: "Danaidae", family: "Diptera", wingLength: 28, wingWidth: 12, weight: 24),
        Insect(name: "Riodinidae", family: "Diptera", wingLength: 20, wingWidth: 16, weight: 18),
    ]
    
    var body: some View {
        Chart(data) {
            PointMark(
                x: .value("Wing Length", $0.wingLength),
                y: .value("Wing Width", $0.wingWidth)
            )
        }
        .frame(height: 400)
        Chart(data) {
            PointMark(
                x: .value("Wing Length", $0.wingLength),
                y: .value("Wing Width", $0.wingWidth)
            )
            .foregroundStyle(by: .value("Family", $0.family))
        }
        .frame(height: 400)
        Chart(data) {
            PointMark(
                x: .value("Wing Length", $0.wingLength),
                y: .value("Wing Length", $0.wingWidth)
            )
            .symbol(by: .value("Family", $0.family))
        }
        .frame(height: 400)
    }
}
