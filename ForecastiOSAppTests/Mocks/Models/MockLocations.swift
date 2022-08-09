//
//  MockLocations.swift
//  ForecastiOSAppTests
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation
@testable import ForecastiOSApp

extension Locations {
    static func getMockLocations() -> Locations {
        return Locations(totalResults: 1,
                         totalPages: 3,
                         page: 1,
                         embedded: Embedded(isSourceAnArray: false,
                                            resources: [],
                                            location: [.getMockLocation()]))
    }
}
