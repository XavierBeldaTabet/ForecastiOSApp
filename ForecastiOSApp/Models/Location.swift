//
//  Model.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 6/8/22.
//

// MARK: - Welcome
struct Location: Codable, Hashable {
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
    }
}

// MARK: - CoastalPoint
struct CoastalPoint: Codable, Hashable {
    let lat: Double
    let lon: Double

    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
    }
}
