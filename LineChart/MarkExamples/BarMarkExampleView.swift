import SwiftUI
import Charts

struct BarMarkExampleView: View {
    struct Profit {
        let department: String
        let profit: Double
    }
    
    let data1: [Profit] = [
        Profit(department: "Production", profit: 15000),
        Profit(department: "Marketing", profit: 8000),
        Profit(department: "Finance", profit: 10000)
    ]
    
    struct ProfitByCategory: Identifiable {
        let department: String
        let profit: Double
        let productCategory: String
        let id = UUID()
    }
    
    let data2: [ProfitByCategory] = [
        ProfitByCategory(department: "Production", profit: 4000, productCategory: "Gizmos"),
        ProfitByCategory(department: "Production", profit: 5000, productCategory: "Gadgets"),
        ProfitByCategory(department: "Production", profit: 6000, productCategory: "Widgets"),
        ProfitByCategory(department: "Marketing", profit: 2000, productCategory: "Gizmos"),
        ProfitByCategory(department: "Marketing", profit: 1000, productCategory: "Gadgets"),
        ProfitByCategory(department: "Marketing", profit: 5000, productCategory: "Widgets"),
        ProfitByCategory(department: "Finance", profit: 2000, productCategory: "Gizmos"),
        ProfitByCategory(department: "Finance", profit: 3000, productCategory: "Gadgets"),
        ProfitByCategory(department: "Finance", profit: 5000, productCategory: "Widgets")
    ]
    
    let data3: [ProfitByCategory] = [
        ProfitByCategory(department: "Production", profit: 4000, productCategory: "Gizmos"),
        ProfitByCategory(department: "Production", profit: 5000, productCategory: "Gadgets"),
        ProfitByCategory(department: "Production", profit: 6000, productCategory: "Widgets")
    ]
    
    struct Job: Identifiable {
        let job: String
        let start: Double
        let end: Double
        let id = UUID()
    }
    
    let data4: [Job] = [
        Job(job: "Job 1", start: 0, end: 15),
        Job(job: "Job 2", start: 5, end: 25),
        Job(job: "Job 1", start: 20, end: 35),
        Job(job: "Job 1", start: 40, end: 55),
        Job(job: "Job 2", start: 30, end: 60),
        Job(job: "Job 2", start: 30, end: 60)
    ]
    
    var body: some View {
        Chart(data1, id: \.department) {
            BarMark(
                x: .value("Department", $0.department),
                y: .value("Profit", $0.profit)
            )
        }
        .frame(height: 400)
        Chart(data2) {
            BarMark(
                x: .value("Category", $0.department),
                y: .value("Profit", $0.profit)
            )
            .foregroundStyle(by: .value("Product Category", $0.productCategory))
        }
        .frame(height: 400)
        Chart(data3) {
            BarMark(
                x: .value("Profit", $0.profit)
            )
            .foregroundStyle(by: .value("Product Category", $0.productCategory))
        }
        .frame(height: 400)
        Chart(data4) {
            BarMark(
                xStart: .value("Start Time", $0.start),
                xEnd: .value("End Time", $0.end),
                y: .value("Job", $0.job)
            )
        }
        .frame(height: 400)
    }
}
