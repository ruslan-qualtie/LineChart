import SwiftUI
import Charts

struct RuleMarkExampleView: View {
    struct Pollen: Identifiable {
        var source: String
        var startDate: Date
        var endDate: Date
        let id = UUID()
        
        init(startMonth: Int, numMonths: Int, source: String) {
            self.source = source
            let calendar = Calendar.autoupdatingCurrent
            self.startDate = calendar.date(from: DateComponents(year: 2020, month: startMonth, day: 1))!
            self.endDate = calendar.date(byAdding: .month, value: numMonths, to: startDate)!
        }
    }
    
    var data1: [Pollen] = [
        Pollen(startMonth: 1, numMonths: 9, source: "Trees"),
        Pollen(startMonth: 12, numMonths: 1, source: "Trees"),
        Pollen(startMonth: 3, numMonths: 8, source: "Grass"),
        Pollen(startMonth: 4, numMonths: 8, source: "Weeds")
    ]
    
    struct DepartmentProfit: Identifiable {
        var department: String
        var profit: Double
        let id = UUID()
    }
    
    var data2: [DepartmentProfit] = [
        DepartmentProfit(department: "Production", profit: 15000),
        DepartmentProfit(department: "Marketing", profit: 8000),
        DepartmentProfit(department: "Finance", profit: 10000)
    ]
    
    var body: some View {
        Chart(data1) {
            RuleMark(
                xStart: .value("Start Date", $0.startDate),
                xEnd: .value("End Date", $0.endDate),
                y: .value("Pollen Source", $0.source)
            )
        }
        .frame(height: 400)
        Chart {
            ForEach(data2) {
                BarMark(
                    x: .value("Department", $0.department),
                    y: .value("Profit", $0.profit)
                )
            }
            RuleMark(y: .value("Break Even Threshold", 9000))
                .foregroundStyle(.red)
        }
        .frame(height: 400)
    }
}
