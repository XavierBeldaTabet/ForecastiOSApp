//
//  Forecast.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 7/8/22.
//
import Foundation

struct Forecast: Codable {
    let created: Date
    let update: Date
    let uv: Uv
    let dayIntervals: [DayInterval]
    let shortIntervals: [Interval]
    let longIntervals: [Interval]
    let links: [Link]
    let embedded: [Embedded]

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
struct DayInterval: Codable {
    let start: Date
    let end: Date
    let twentyFourHourSymbol: String
    let twelveHourSymbols: [String]
    let sixHourSymbols: [String]
    let symbolConfidence: String
    let precipitation: Precipitation
    let temperature: Temperature
    let wind: DayIntervalWind

    enum CodingKeys: String, CodingKey {
        case start = "start"
        case end = "end"
        case twentyFourHourSymbol = "twentyFourHourSymbol"
        case twelveHourSymbols = "twelveHourSymbols"
        case sixHourSymbols = "sixHourSymbols"
        case symbolConfidence = "symbolConfidence"
        case precipitation = "precipitation"
        case temperature = "temperature"
        case wind = "wind"
    }
}

// MARK: - Precipitation
struct Precipitation: Codable {
    let min: Int
    let max: Int
    let value: Int
    let pop: Int
    let probability: Int

    enum CodingKeys: String, CodingKey {
        case min = "min"
        case max = "max"
        case value = "value"
        case pop = "pop"
        case probability = "probability"
    }
}

// MARK: - Temperature
struct Temperature: Codable {
    let value: Int
    let min: Int
    let max: Int
    let feelsLike: Int
    let probability: Probability

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case min = "min"
        case max = "max"
        case feelsLike = "feelsLike"
        case probability = "probability"
    }
}

// MARK: - Probability
struct Probability: Codable {
    let tenPercentile: Int
    let ninetyPercentile: Int

    enum CodingKeys: String, CodingKey {
        case tenPercentile = "tenPercentile"
        case ninetyPercentile = "ninetyPercentile"
    }
}

// MARK: - DayIntervalWind
struct DayIntervalWind: Codable {
    let min: Int
    let max: Int
    let maxGust: Int

    enum CodingKeys: String, CodingKey {
        case min = "min"
        case max = "max"
        case maxGust = "maxGust"
    }
}

// MARK: - Interval
struct Interval: Codable {
    let symbol: Symbol
    let symbolCode: SymbolCode
    let precipitation: Precipitation
    let temperature: Temperature
    let wind: LongIntervalWind
    let feelsLike: DewPoint
    let pressure: DewPoint
    let uvIndex: DewPoint
    let cloudCover: CloudCover
    let humidity: DewPoint
    let dewPoint: DewPoint
    let start: Date
    let end: Date
    let nominalStart: String
    let nominalEnd: String

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
struct CloudCover: Codable {
    let value: Int
    let high: Int
    let middle: Int
    let low: Int
    let fog: Int

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case high = "high"
        case middle = "middle"
        case low = "low"
        case fog = "fog"
    }
}

// MARK: - DewPoint
struct DewPoint: Codable {
    let value: Int

    enum CodingKeys: String, CodingKey {
        case value = "value"
    }
}

// MARK: - Symbol
struct Symbol: Codable {
    let sunup: Bool
    let n: Int
    let clouds: Int
    let thunder: Bool
    let precipPhase: String
    let precip: Int
    let symbolVar: String

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
struct SymbolCode: Codable {
    let next1Hour: String
    let next6Hours: String
    let next12Hours: String

    enum CodingKeys: String, CodingKey {
        case next1Hour = "next1Hour"
        case next6Hours = "next6Hours"
        case next12Hours = "next12Hours"
    }
}

// MARK: - LongIntervalWind
struct LongIntervalWind: Codable {
    let direction: Int?
    let gust: Int?
    let speed: Int?
    let areaMaxSpeed: Int?
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
struct Uv: Codable {
    let duration: Duration
    let url: String
    let displayURL: String

    enum CodingKeys: String, CodingKey {
        case duration = "duration"
        case url = "url"
        case displayURL = "displayUrl"
    }
}

// MARK: - Duration
struct Duration: Codable {
    let days: Int
    let hours: Int

    enum CodingKeys: String, CodingKey {
        case days = "days"
        case hours = "hours"
    }
}
