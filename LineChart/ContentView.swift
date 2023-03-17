//
//  ContentView.swift
//  LineChart
//
//  Created by Yuri Goncharov on 03.02.2023.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        Group {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Jump")
                            .font(.system(size: 16))
                            .foregroundColor(Color("geekblue-3"))
                        Text("The Jump Scan consists of a series of vertical jumps and is utilized to assess dynamic movement strategy and efficiency.")
                            .font(.system(size: 16, weight: .thin))
                            .foregroundColor(.white)
                            .lineSpacing(4)
                            .tracking(0.52)
                    }
                    Spacer(minLength: 220)
                    HStack(spacing: 36) {
                        VStack(alignment: .trailing) {
                            BarChartStatView(stat: .loadNegativeDelta)
                            HStack {
                                BasicChartSymbolShape
                                    .circle
                                    .strokeBorder(lineWidth: 2)
                                    .foregroundColor(.loadLine)
                                    .frame(width: 13, height: 13)
                                Text("Load")
                                    .font(.system(size: 14))
                                    .foregroundColor(.axisValueLabel)
                            }
                        }
                        VStack(alignment: .trailing) {
                            BarChartStatView(stat: .explodePositiveDelta)
                            HStack {
                                BasicChartSymbolShape
                                    .square
                                    .strokeBorder(lineWidth: 2)
                                    .foregroundColor(.explodeLine)
                                    .frame(width: 13, height: 13)
                                Text("Explode")
                                    .font(.system(size: 14))
                                    .foregroundColor(.axisValueLabel)
                            }
                        }
                        VStack(alignment: .trailing) {
                            BarChartStatView(stat: .drivePositiveDelta)
                            HStack {
                                BasicChartSymbolShape
                                    .triangle
                                    .strokeBorder(lineWidth: 2)
                                    .foregroundColor(.driveLine)
                                    .frame(width: 13, height: 13)
                                Text("Drive")
                                    .font(.system(size: 14))
                                    .foregroundColor(.axisValueLabel)
                            }
                        }
                    }
                }
//                LineChart(dataSource: dataSouce)
                SwiftUILineChart(dataSource: dataSouce)
//                Group {
//                    if #available(macOS 13, *) {
//                        SwiftUILineChart(dataSource: dataSouce)
//                    } else {
//                        LineChart(dataSource: dataSouce)
//                    }
//                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, 20)
            }
            .padding(24)
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("chart").opacity(0.03))
        )
        .padding(32)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
