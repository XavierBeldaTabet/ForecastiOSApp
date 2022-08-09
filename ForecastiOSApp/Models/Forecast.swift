//
//  Forecast.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 7/8/22.
//
import Foundation

enum ForecastData: String, Codable, Hashable {
    case rainshowers_day
    case rainshowers_night
    case rain
    case cloud
    case lightrain
    case lightrainshowers_day
    case lightrainshowers_night
    case partlycloudy_night
    case partlycloudy_day
    case clearsky_day
    case clearsky_night
    case fair_day
    case fair_night
    case heavyrain
    case heavyrainshowers_night
    case heavyrainshowers_day
    case fog
}

struct Forecast: Codable, Hashable {
    let created: String?
    let update: String?
    let uv: Uv?
    let dayIntervals: [DayInterval]?
    let shortIntervals: [Interval]?
    let longIntervals: [Interval]?
    let links: Link?
    let embedded: [Embedded]?

    enum CodingKeys: String, CodingKey {
        case created = "created"
        case update = "update"
        case uv = "uv"
        case dayIntervals = "dayIntervals"
        case shortIntervals = "shortIntervals"
        case longIntervals = "longIntervals"
        case links = "_links"
        case embedded = "_embedded"
    }
}

// MARK: - DayInterval
struct DayInterval: Codable, Hashable {
    let start: String?
    let end: String?
    let twentyFourHourSymbol: ForecastData?
    let symbolConfidence: String?
    let precipitation: Precipitation?
    let temperature: Temperature?
    let wind: DayIntervalWind?

    enum CodingKeys: String, CodingKey {
        case start = "start"
        case end = "end"
        case twentyFourHourSymbol = "twentyFourHourSymbol"
        case symbolConfidence = "symbolConfidence"
        case precipitation = "precipitation"
        case temperature = "temperature"
        case wind = "wind"
    }
}

// MARK: - Precipitation
struct Precipitation: Codable, Hashable {
    let min: Double?
    let max: Double?
    let value: Double?
    let pop: Double?
    let probability: Double?

    enum CodingKeys: String, CodingKey {
        case min = "min"
        case max = "max"
        case value = "value"
        case pop = "pop"
        case probability = "probability"
    }
}

// MARK: - Temperature
struct Temperature: Codable, Hashable {
    let value: Double?
    let min: Double?
    let max: Double?
    let feelsLike: Double?
    let probability: Probability?

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case min = "min"
        case max = "max"
        case feelsLike = "feelsLike"
        case probability = "probability"
    }
}

// MARK: - Probability
struct Probability: Codable, Hashable {
    let tenPercentile: Double?
    let ninetyPercentile: Double?

    enum CodingKeys: String, CodingKey {
        case tenPercentile = "tenPercentile"
        case ninetyPercentile = "ninetyPercentile"
    }
}

// MARK: - DayIntervalWind
struct DayIntervalWind: Codable, Hashable{
    let min: Double?
    let max: Double?
    let maxGust: Double?

    enum CodingKeys: String, CodingKey {
        case min = "min"
        case max = "max"
        case maxGust = "maxGust"
    }
}

// MARK: - Interval
struct Interval: Codable, Hashable {
    let symbol: Symbol?
    let symbolCode: SymbolCode?
    let precipitation: Precipitation?
    let temperature: Temperature?
    let wind: LongIntervalWind?
    let feelsLike: DewPoint?
    let pressure: DewPoint?
    let uvIndex: DewPoint?
    let cloudCover: CloudCover?
    let humidity: DewPoint?
    let dewPoint: DewPoint?
    let start: String?
    let end: String?
    let nominalStart: String?
    let nominalEnd: String?

    enum CodingKeys: String, CodingKey {
        case symbol = "symbol"
        case symbolCode = "symbolCode"
        case precipitation = "precipitation"
        case temperature = "temperature"
        case wind = "wind"
        case feelsLike = "feelsLike"
        case pressure = "pressure"
        case uvIndex = "uvIndex"
        case cloudCover = "cloudCover"
        case humidity = "humidity"
        case dewPoint = "dewPoint"
        case start = "start"
        case end = "end"
        case nominalStart = "nominalStart"
        case nominalEnd = "nominalEnd"
    }
}

// MARK: - CloudCover
struct CloudCover: Codable, Hashable {
    let value: Double?
    let high: Double?
    let middle: Double?
    let low: Double?
    let fog: Double?

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case high = "high"
        case middle = "middle"
        case low = "low"
        case fog = "fog"
    }
}

// MARK: - DewPoint
struct DewPoint: Codable, Hashable {
    let value: Double?

    enum CodingKeys: String, CodingKey {
        case value = "value"
    }
}

// MARK: - Symbol
struct Symbol: Codable, Hashable {
    let sunup: Bool?
    let n: Double?
    let clouds: Double?
    let thunder: Bool?
    let precipPhase: String?
    let precip: Double?
    let symbolVar: String?

    enum CodingKeys: String, CodingKey {
        case sunup = "sunup"
        case n = "n"
        case clouds = "clouds"
        case thunder = "thunder"
        case precipPhase = "precipPhase"
        case precip = "precip"
        case symbolVar = "var"
    }
}

// MARK: - SymbolCode
struct SymbolCode: Codable, Hashable {
    let next1Hour: String?
    let next6Hours: String?
    let next12Hours: String?

    enum CodingKeys: String, CodingKey {
        case next1Hour = "next1Hour"
        case next6Hours = "next6Hours"
        case next12Hours = "next12Hours"
    }
}

// MARK: - LongIntervalWind
struct LongIntervalWind: Codable, Hashable {
    let direction: Double?
    let gust: Double?
    let speed: Double?
    let areaMaxSpeed: Double?
    let probability: Probability?

    enum CodingKeys: String, CodingKey {
        case direction = "direction"
        case gust = "gust"
        case speed = "speed"
        case areaMaxSpeed = "areaMaxSpeed"
        case probability = "probability"
    }
}

// MARK: - Uv
struct Uv: Codable, Hashable {
    let duration: Duration?
    let url: String?
    let displayURL: String?

    enum CodingKeys: String, CodingKey {
        case duration = "duration"
        case url = "url"
        case displayURL = "displayUrl"
    }
}

// MARK: - Duration
struct Duration: Codable, Hashable {
    let days: Double?
    let hours: Double?

    enum CodingKeys: String, CodingKey {
        case days = "days"
        case hours = "hours"
    }
}
