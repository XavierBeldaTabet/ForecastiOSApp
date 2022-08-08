//
//  Locations.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 8/8/22.
//

import Foundation

struct Locations: Codable {
    let totalResults: Int?
    let totalPages: Int?
    let page: Int?
    let embedded: Embedded?

    enum CodingKeys: String, CodingKey {
        case totalResults = "totalResults"
        case totalPages = "totalPages"
        case page = "page"
        case embedded = "_embedded"
    }
}
