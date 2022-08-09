//
//  Embedded.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 7/8/22.
//

import Foundation

struct Embedded: Codable, Hashable {
    let isSourceAnArray: Bool?
    let resources: [Resource]?
    let location: [Location]?
    
    enum CodingKeys: String, CodingKey {
        case isSourceAnArray = "isSourceAnArray"
        case resources = "resources"
        case location = "location"
    }
}
