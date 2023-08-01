//
//  Graphics.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 27.07.2023.
//
import SwiftUICharts
import SwiftUI

struct Graphics: View {
    var body: some View {
        VStack {
            LineChartView(data: [100,145,123,167,189,165,187], title: "Sales")
            //PieChartView(data: [100,145,123,167,189,165,187], title: "Sales")
            BarChartView(data: ChartData(values: [("Jan", 100), ("Feb", 145), ("Mar", 123), ("Apr", 167), ("May", 189),("Jul", 165), ("July",187)]), title: "Bar Chart")
        }.padding()
    }
}

struct Graphics_Previews: PreviewProvider {
    static var previews: some View {
        Graphics()
    }
}
