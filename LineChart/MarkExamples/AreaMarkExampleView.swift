import SwiftUI
import Charts

struct AreaMarkExampleView: View {
    let cheeseburgerCost: [Food] = [
        .init(name: "Cheeseburger", price: 0.15, year: 1960),
        .init(name: "Cheeseburger", price: 0.20, year: 1970),
        .init(name: "Cheeseburger", price: 1.10, year: 2020)
    ]
    
    let cheeseburgerCostByItem: [Food] = [
        .init(name: "Burger", price: 0.07, year: 1960),
        .init(name: "Cheese", price: 0.03, year: 1960),
        .init(name: "Bun", price: 0.05, year: 1960),
        .init(name: "Burger", price: 0.10, year: 1970),
        .init(name: "Cheese", price: 0.04, year: 1970),
        .init(name: "Bun", price: 0.06, year: 1970),
        .init(name: "Burger", price: 0.60, year: 2020),
        .init(name: "Cheese", price: 0.26, year: 2020),
        .init(name: "Bun", price: 0.24, year: 2020)
    ]
    
    struct Food: Identifiable {
        let name: String
        let price: Double
        let date: Date
        let id = UUID()
        
        init(name: String, price: Double, year: Int) {
            self.name = name
            self.price = price
            let calendar = Calendar.autoupdatingCurrent
            self.date = calendar.date(from: DateComponents(year: year))!
        }
    }
    
    let data: [Weather] = [
        .init(date: .init(timeIntervalSince1970: 0), maximumTemperature: 20, minimumTemperature: 10, id: 0),
        .init(date: .init(timeIntervalSince1970: 3600 * 24), maximumTemperature: 30, minimumTemperature: 20, id: 1),
        .init(date: .init(timeIntervalSince1970: 3600 * 48), maximumTemperature: 10, minimumTemperature: 5, id: 2)
    ]
    
    struct Weather: Identifiable {
        let date: Date
        let maximumTemperature: Double
        let minimumTemperature: Double
        let id: Int
    }
    
    var body: some View {
        Chart(cheeseburgerCost) { cost in
            AreaMark(
                x: .value("Date", cost.date),
                y: .value("Price", cost.price)
            )
        }
        .frame(height: 400)
        Chart(cheeseburgerCostByItem) { cost in
            AreaMark(
                x: .value("Date", cost.date),
                y: .value("Price", cost.price)
            )
            .foregroundStyle(by: .value("Food Item", cost.name))
        }
        .frame(height: 400)
        Chart(cheeseburgerCostByItem) { cost in
            AreaMark(
                x: .value("Date", cost.date),
                y: .value("Price", cost.price),
                stacking: .center // .normalized
            )
            .foregroundStyle(by: .value("Food Item", cost.name))
        }
        .frame(height: 400)
        Chart(data) { day in
            AreaMark(
                x: .value("Date", day.date),
                yStart: .value("Minimum Temperature", day.minimumTemperature),
                yEnd: .value("Maximum Temperature", day.maximumTemperature)
            )
        }
        .frame(height: 400)
    }
}
