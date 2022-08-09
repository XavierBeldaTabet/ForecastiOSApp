//
//  ForecastLocationViewModel.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 8/8/22.
//

import Foundation

class ForecastLocationViewModel: ObservableObject {
    
    var locationTitle: String?
    var date: String?
    var forecastData: (String, String)?
    var temperature: String?
    var maxTemperature: String?
    var minTemperature: String?
    var wind: String?
    var precipitation: String?
    var nextDaysForecast: [(String, String, String, String)] = []
        
    private var location: Location
    private var forecast: Forecast?
    private var getForecastBuilder: GetForecastForLocationOperation.Builder
    
    init(location: Location,
        getForecastBuilder: @escaping GetForecastForLocationOperation.Builder = GetForecastForLocationOperation.defaultBuilder) {
        self.location = location
        self.getForecastBuilder = getForecastBuilder
        
        getForecastForLocation()
    }
    
    private func setUpView() {
        if let dayForecast = forecast?.dayIntervals?.first {
            locationTitle = location.name ?? ""
            date = forecast?.update?.toDate().toString() ?? ""
            forecastData = getForecast(data: dayForecast.twentyFourHourSymbol ?? .clearsky_day)
            temperature = dayForecast.temperature?.value?.toString()
            maxTemperature = dayForecast.temperature?.max?.toString() ?? "-"
            minTemperature = dayForecast.temperature?.min?.toString() ?? "-"
            wind = dayForecast.wind?.max?.toString() ?? "-"
            precipitation = dayForecast.precipitation?.value?.toString() ?? "0"
            nextDaysForecast = getNextDaysForecastData(data: Array(forecast?.dayIntervals?.prefix(6) ?? []))
        }
    }
    
    private func getForecastForLocation() {
        let operation = getForecastBuilder(location.id ?? "") { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let forecast):
                    self.forecast = forecast
                    self.setUpView()

                case .failure(_):
                    break
                }
            }
        }
        
        operation.start()
    }
    
    private func getNextDaysForecastData(data: [DayInterval]) -> [(String, String, String, String)] {
        
        let forecast: [(String, String, String, String)] = data.map { dayInterval in
            let date = dayInterval.start?.toDate().toDayString() ?? "-"
            let icon = getForecast(data: dayInterval.twentyFourHourSymbol ?? .clearsky_day)
            let tMax = dayInterval.temperature?.max?.toString() ?? "-"
            let tMin = dayInterval.temperature?.min?.toString() ?? "-"
            return (date, icon.1, tMax, tMin)
        }.suffix(5)
        
        return forecast
    }
    
    private func getForecast(data: ForecastData) -> (String, String) {
        switch data {
        case .rainshowers_day, .rain, .rainshowers_night, .heavyrain, .heavyrainshowers_day, .heavyrainshowers_night:
            return ("Rain", "cloud.heavyrain")
        case .lightrain, .lightrainshowers_day:
            return ("Partial rain", "cloud.sun.rain")
        case .lightrainshowers_night:
            return ("Partial rain", "cloud.moon.rain")
        case .cloud:
            return("Cloudy", "cloud")
        case .partlycloudy_night:
            return("Cloudy", "cloud.moon")
        case .partlycloudy_day:
            return("Cloudy", "cloud.sun")
        case .clearsky_day, .fair_day:
            return ("Clear", "sun.max")
        case .clearsky_night, .fair_night:
            return ("Clear", "moon")
        case .fog:
            return ("Fog", "cloud.fog")
        }
    }
}
