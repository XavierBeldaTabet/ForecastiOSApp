//
//  ForecastLocationDataView.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 9/8/22.
//

import SwiftUI

struct ForecastLocationDataView: View {
    var icon: String?
    var forecast: String?
    @Binding var temperature: String?
    @Binding var maxTemp: String?
    @Binding var minTemp: String?
    @Binding var wind: String?
    @Binding var rain: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon ?? "sun.max")
                    .resizable()
                    .frame(width: 40, height: 40)
                
                Text(forecast ?? "Sunny")
                    .font(.title)
                    .fontWeight(.light)
            }.padding(10)
            
            HStack {
                Text(($temperature.wrappedValue ?? "-") + "º")
                    .font(.system(size: 80))
                    .fontWeight(.ultraLight)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("MAX TEMP")
                        Spacer()
                        Text(($maxTemp.wrappedValue ?? "-") + "ºC")
                    }.padding(.bottom, 1)
                    
                    HStack {
                        Text("MIN TEMP")
                        Spacer()
                        Text(($minTemp.wrappedValue ?? "-") + "ºC")
                    }.padding(.bottom, 1)
                    
                    HStack {
                        Text("WIND SPEED")
                        Spacer()
                        Text(($wind.wrappedValue ?? "-") + "km/h")
                    }.padding(.bottom, 1)
                    
                    HStack {
                        Text("PRECIPITATION")
                        Spacer()
                        Text(($rain.wrappedValue ?? "-") + "%")
                    }.padding(.bottom, 1)
                }.font(.caption)
                    .padding(.leading, 5)
            }.padding(10)
        }
    }
}
