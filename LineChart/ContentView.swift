//
//  ContentView.swift
//  LineChart
//
//  Created by Yuri Goncharov on 03.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Group {
            VStack(alignment: .leading, spacing: 4) {
                Text("Jump")
                    .font(.system(size: 16))
                    .foregroundColor(Color("geekblue3"))
                Text("The Jump Scan consists of a series of vertical jumps and is utilized to assess dynamic movement strategy and efficiency.")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .lineSpacing(4)
                Group {
                    if #available(macOS 13, *) {
                        SwiftUILineChart(dataSource: dataSouce)
                    } else {
                        LineChart(dataSource: dataSouce)
                    }
                }
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
