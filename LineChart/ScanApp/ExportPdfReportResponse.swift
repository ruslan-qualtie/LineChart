import Foundation

public struct ExportPdfReportResponse: Codable {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from apiResponse: Data) {
        let responseJsonDictionary = try? JSONSerialization.jsonObject(with: apiResponse) as? NSDictionary
        let dataDictionary = responseJsonDictionary!["data"] as? NSDictionary
        let exportPdfReportDictionary = dataDictionary!["exportPdfReport"] as? NSDictionary
        data = try! JSONSerialization.data(withJSONObject: exportPdfReportDictionary!, options: [.sortedKeys, .prettyPrinted])
    }

    public var asJSONString: String {
        data.asciiString
    }

    public var exportPdfReport: ExportPdfReport {
        try! JSONDecoder().decode(ExportPdfReport.self, from: data)
    }

    public var longitudinalCharts: [LongitudinalChartData] {
        guard let longitudinalChartsArray = asDictionary["longitudinalCharts"] as? NSArray else {
            return []
        }

        let longitudinalChartData = try! JSONSerialization.data(withJSONObject: longitudinalChartsArray as Any, options: [.prettyPrinted])
        return try! JSONDecoder().decode([LongitudinalChartData].self, from: longitudinalChartData)
    }

    public var recentScansMetricsAsJSONString: String {
        guard let recentScansMetricsDictionary = asDictionary["recentScansMetrics"] as? NSDictionary else {
            return ""
        }
        let recentScansMetricsData = try! JSONSerialization.data(withJSONObject: recentScansMetricsDictionary,
                                                                 options: [.prettyPrinted, .sortedKeys]
        )
        return recentScansMetricsData.asciiString
    }

    private var asDictionary: NSDictionary {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            return jsonObject as! NSDictionary
        } catch {
            print("error:\(error)")
        }
        return NSDictionary()
    }
}

extension ExportPdfReportResponse: Equatable {}
