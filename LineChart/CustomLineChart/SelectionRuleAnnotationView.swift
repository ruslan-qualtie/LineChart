import SwiftUI

struct SelectionRuleAnnotationView: View {
    let content: SelectionRuleAnnotation
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(content.headLines, id: \.self) { line in
                Text(line).id(line)
            }
            Line()
                .stroke(style: StrokeStyle(lineWidth: 1))
                .frame(height: 1)
                .padding(.horizontal, 4)
                .foregroundColor(.axisValueLabel)
            Text(content.bottomLine)
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

#if DEBUG
public struct SelectionRuleAnnotationView_Previews: PreviewProvider {
    public static var previews: some View {
        SelectionRuleAnnotationView(content: .sample)
            .frame(maxWidth: 200)
    }
}
#endif
