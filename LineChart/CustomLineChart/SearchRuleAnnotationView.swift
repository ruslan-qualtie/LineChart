import SwiftUI

struct SearchRuleAnnotationView: View {
    let date: Date
    let value: Double
    var body: some View {
        VStack(alignment: .leading) {
            Text("DATE: \(DateFormatter.short.string(from: date))")
            Text("VALUE: \(Int(value))")
        }
        .padding()
        .foregroundColor(.axisValueLabel)
        .background(Color.pageBackground)
        .overlay(
            RoundedRectangle(cornerRadius: 8.0, style: .circular)
                .stroke(Color.axisValueLabel, lineWidth: 1)
        )
    }
}
