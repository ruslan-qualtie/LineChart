import SwiftUI
import Charts

struct LineMarkExampleView: View {
    struct MonthlyHoursOfSunshine {
        var date: Date
        var hoursOfSunshine: Double
        
        init(month: Int, hoursOfSunshine: Double) {
            let calendar = Calendar.autoupdatingCurrent
            self.date = calendar.date(from: DateComponents(year: 2020, month: month))!
            self.hoursOfSunshine = hoursOfSunshine
        }
    }
    
    struct CityMonthlyHoursOfSunshine: Identifiable {
        var city: String
        var date: Date
        var hoursOfSunshine: Double
        let id = UUID()
        
        init(city: String, month: Int, hoursOfSunshine: Double) {
            let calendar = Calendar.autoupdatingCurrent
            self.city = city
            self.date = calendar.date(from: DateComponents(year: 2020, month: month))!
            self.hoursOfSunshine = hoursOfSunshine
        }
    }
    
    var data1: [MonthlyHoursOfSunshine] = [
        MonthlyHoursOfSunshine(month: 1, hoursOfSunshine: 74),
        MonthlyHoursOfSunshine(month: 2, hoursOfSunshine: 99),
        MonthlyHoursOfSunshine(month: 3, hoursOfSunshine: 174),
        MonthlyHoursOfSunshine(month: 4, hoursOfSunshine: 200),
        MonthlyHoursOfSunshine(month: 5, hoursOfSunshine: 250),
        MonthlyHoursOfSunshine(month: 6, hoursOfSunshine: 240),
        MonthlyHoursOfSunshine(month: 7, hoursOfSunshine: 310),
        MonthlyHoursOfSunshine(month: 8, hoursOfSunshine: 270),
        MonthlyHoursOfSunshine(month: 9, hoursOfSunshine: 200),
        MonthlyHoursOfSunshine(month: 10, hoursOfSunshine: 120),
        MonthlyHoursOfSunshine(month: 11, hoursOfSunshine: 80),
        MonthlyHoursOfSunshine(month: 12, hoursOfSunshine: 62)
    ]
    
    var data2: [CityMonthlyHoursOfSunshine] = [
        CityMonthlyHoursOfSunshine(city: "Seattle", month: 1, hoursOfSunshine: 74),
        CityMonthlyHoursOfSunshine(city: "Cupertino", month: 1, hoursOfSunshine: 196),
        CityMonthlyHoursOfSunshine(city: "Seattle", month: 2, hoursOfSunshine: 99),
        CityMonthlyHoursOfSunshine(city: "Cupertino", month: 2, hoursOfSunshine: 199),
        CityMonthlyHoursOfSunshine(city: "Seattle", month: 3, hoursOfSunshine: 174),
        CityMonthlyHoursOfSunshine(city: "Cupertino", month: 3, hoursOfSunshine: 274),
        CityMonthlyHoursOfSunshine(city: "Seattle", month: 4, hoursOfSunshine: 200),
        CityMonthlyHoursOfSunshine(city: "Cupertino", month: 4, hoursOfSunshine: 300),
        CityMonthlyHoursOfSunshine(city: "Seattle", month: 5, hoursOfSunshine: 250),
        CityMonthlyHoursOfSunshine(city: "Cupertino", month: 5, hoursOfSunshine: 350),
        CityMonthlyHoursOfSunshine(city: "Seattle", month: 6, hoursOfSunshine: 240),
        CityMonthlyHoursOfSunshine(city: "Cupertino", month: 6, hoursOfSunshine: 340),
        CityMonthlyHoursOfSunshine(city: "Seattle", month: 7, hoursOfSunshine: 310),
        CityMonthlyHoursOfSunshine(city: "Cupertino", month: 7, hoursOfSunshine: 410),
        CityMonthlyHoursOfSunshine(city: "Seattle", month: 8, hoursOfSunshine: 270),
        CityMonthlyHoursOfSunshine(city: "Cupertino", month: 8, hoursOfSunshine: 370),
        CityMonthlyHoursOfSunshine(city: "Seattle", month: 9, hoursOfSunshine: 200),
        CityMonthlyHoursOfSunshine(city: "Cupertino", month: 9, hoursOfSunshine: 300),
        CityMonthlyHoursOfSunshine(city: "Seattle", month: 10, hoursOfSunshine: 120),
        CityMonthlyHoursOfSunshine(city: "Cupertino", month: 10, hoursOfSunshine: 220),
        CityMonthlyHoursOfSunshine(city: "Seattle", month: 11, hoursOfSunshine: 80),
        CityMonthlyHoursOfSunshine(city: "Cupertino", month: 11, hoursOfSunshine: 180),
        CityMonthlyHoursOfSunshine(city: "Seattle", month: 12, hoursOfSunshine: 62),
        CityMonthlyHoursOfSunshine(city: "Cupertino", month: 12, hoursOfSunshine: 199)
    ]
    
    var body: some View {
        Chart(data1, id: \.date) {
            LineMark(
                x: .value("Month", $0.date),
                y: .value("Hours of Sunshine", $0.hoursOfSunshine)
            )
        }
        .frame(height: 400)
        Chart(data2) {
            LineMark(
                x: .value("Month", $0.date),
                y: .value("Hours of Sunshine", $0.hoursOfSunshine)
            )
            .foregroundStyle(by: .value("City", $0.city))
        }
        .frame(height: 400)
    }
}
