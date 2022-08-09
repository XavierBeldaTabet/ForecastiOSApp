//
//  ForecastNextDaysView.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 9/8/22.
//

import SwiftUI

struct ForecastNextDaysView: View {
    var nextDaysForecast: [(String, String, String, String)] = []
    
    var body: some View {
        VStack {
            HStack {
                Text("5-Day Forecast").foregroundColor(.gray)
                
                Spacer()
            }.padding(.leading)
            
            Divider()
                .padding([.leading, .trailing])
            
            ForEach(nextDaysForecast, id: \.0) { forecast in
                ZStack {
                    HStack {
                        Text(forecast.0 )
                        Spacer()
                        Text(forecast.2).padding(8)
                        Text(forecast.3).foregroundColor(.gray)
                    }.padding([.leading, .trailing])
                    
                    Image(systemName: forecast.1)
                        .resizable()
                        .aspectRatio(UIImage(systemName: forecast.1)?.size ?? CGSize(width: 50, height: 25), contentMode: .fit)
                        .frame(width: 50, height: 25)
                }
            }
        }
    }
}


struct ForecastNextDaysView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastNextDaysView()
    }
}
