//
//  Model.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 6/8/22.
//

// MARK: - Welcome
struct Location: Codable {
    let category: Category?
    let id: String?
    let name: String?
    let position: CoastalPoint?
    let elevation: Int?
    let coastalPoint: CoastalPoint?
    let timeZone: String?
    let urlPath: String?
    let country: Category?
    let region: Category?
    let subregion: Category?
    let isInOcean: Bool?
    let links: Link?
    let embedded: [Embedded]?

    enum CodingKeys: String, CodingKey {
        case category = "category"
        case id = "id"
        case name = "name"
        case position = "position"
        case elevation = "elevation"
        case coastalPoint = "coastalPoint"
        case timeZone = "timeZone"
        case urlPath = "urlPath"
        case country = "country"
        case region = "region"
        case subregion = "subregion"
        case isInOcean = "isInOcean"
        case links = "_links"
        case embedded = "_embedded"
    }
}

// MARK: - Category
struct Category: Codable {
    let id: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

// MARK: - CoastalPoint
struct CoastalPoint: Codable {
    let lat: Int
    let lon: Int

    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
    }
}
