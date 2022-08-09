//
//  MockLocation.swift
//  ForecastiOSAppTests
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation
@testable import ForecastiOSApp

extension Location {
    static func getMockLocation() -> Location {
        return Location(category: Category(id: "mockCategoryId", name: "mockCategoryName"),
                                id: "mockId",
                                name: "mockName",
                                position: CoastalPoint(lat: 1.0, lon: 5.0),
                                elevation: 2,
                                coastalPoint: CoastalPoint(lat: 1.0, lon: 5.0),
                                timeZone: "mockTimeZone",
                                urlPath: "mockPath",
                                country: Category(id: "mockCategoryId", name: "mockCategoryName"),
                                region: Category(id: "mockCategoryId", name: "mockCategoryName"),
                                subregion: Category(id: "mockCategoryId", name: "mockCategoryName"),
                                isInOcean: true)
    }
}
