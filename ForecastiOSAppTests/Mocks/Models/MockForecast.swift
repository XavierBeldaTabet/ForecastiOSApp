//
//  MockForecast.swift
//  ForecastiOSAppTests
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation
@testable import ForecastiOSApp

extension Forecast {
    static func getMockForecast() -> Forecast {
        return Forecast(created: "2022-08-09T23:00:00+02:00",
                        update: "2022-08-09T23:00:00+02:00",
                        uv: Uv(duration: Duration(days: 5, hours: 2.0), url: "mockUrl", displayURL: "mockDisplayUrl"),
                        dayIntervals: [DayInterval(start: "2022-08-09T23:00:00+02:00",
                                                   end: "2022-08-09T23:00:00+02:00",
                                                   twentyFourHourSymbol: .clearsky_day,
                                                   symbolConfidence: "mockSymbolConfidence",
                                                   precipitation: Precipitation(min: 5.0, max: 20.0, value: 2.0, pop: 45, probability: 34),
                                                   temperature: Temperature(value: 5, min: 3, max: 2, feelsLike: 2, probability: Probability(tenPercentile: 5, ninetyPercentile: 5)),
                                                   wind: DayIntervalWind(min: 5, max: 5, maxGust: 5)
                                                  )],
                        shortIntervals: [],
                        longIntervals: [],
                        links: Link(curie: Curie(name: "mockNAme", href: "mockHref"),
                                    rel: "mockrel", href: "mockhref", title: "mockTitle", type: "mockType", deprecation: "mockDeprecation", name: "mockName", profile: "mockProfile", hrefLang: "mockhrefLang", isTemplated: false),
                        embedded: [Embedded(isSourceAnArray: false,
                                            resources: [Resource(links: [])],
                                            location: [Location(category: Category(id: "mockCategoru", name: "mockName"),
                                                                id: "mockLocationId",
                                                                name: "mockLocationName",
                                                                position: CoastalPoint(lat: 5, lon: 5),
                                                                elevation: 4,
                                                                coastalPoint: CoastalPoint(lat: 5, lon: 5),
                                                                timeZone: "mockTimeZone",
                                                                urlPath: "MockUrlPath",
                                                                country: Category(id: "mockCategoru", name: "mockName"),
                                                                region: Category(id: "mockCategoru", name: "mockName"),
                                                                subregion: Category(id: "mockCategoru", name: "mockName"),
                                                                isInOcean: false)
                                            ])
                        ])
    }
}
