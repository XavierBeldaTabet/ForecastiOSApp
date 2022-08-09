//
//  ForecastLocationView.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 8/8/22.
//

import SwiftUI

struct ForecastLocationView: View {
    @StateObject var viewModel: ForecastLocationViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text($viewModel.locationTitle.wrappedValue ?? "").font(.title).fontWeight(.light)
                Text($viewModel.date.wrappedValue ?? "")
                Spacer()
                ForecastLocationDataView(icon: viewModel.forecastData?.1,
                                         forecast: viewModel.forecastData?.0,
                                         temperature: $viewModel.temperature,
                                         maxTemp: $viewModel.maxTemperature,
                                         minTemp: $viewModel.minTemperature,
                                         wind: $viewModel.wind,
                                         rain: $viewModel.precipitation)
                Spacer()
                ForecastNextDaysView(nextDaysForecast: viewModel.nextDaysForecast)
            }
        }.preferredColorScheme(.dark)
    }
}

struct ForeCastLocationView_Preview: PreviewProvider {
    static var previews: some View {
        let location = Location(category: nil, id: nil, name: nil, position: nil, elevation: nil, coastalPoint: nil, timeZone: nil, urlPath: nil, country: nil, region: nil, subregion: nil, isInOcean: nil)
        let viewModel = ForecastLocationViewModel(location: location)
        ForecastLocationView(viewModel: viewModel)
    }
}
