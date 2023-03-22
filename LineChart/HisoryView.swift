import SwiftUI
import Charts

struct HisoryView: View {
    var body: some View {
        ScrollView(.vertical) {
            HisoryHeaderView()
            LongitudinalChartView(dataSource: dataSouce)
        }
        .padding(32)
        .background(Color.pageBackground)
        
    }
}

#if DEBUG
public struct HisoryView_Previews: PreviewProvider {
    public static var previews: some View {
        HisoryView()
            .frame(minWidth: 1_240, minHeight: 800)
    }
}
#endif
