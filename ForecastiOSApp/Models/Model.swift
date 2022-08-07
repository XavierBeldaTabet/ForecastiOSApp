//
//  Model.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 6/8/22.
//

// MARK: - Welcome
struct Welcome: Codable {
    let category: Category
    let id: String
    let name: String
    let position: CoastalPoint
    let elevation: Int
    let coastalPoint: CoastalPoint
    let timeZone: String
    let urlPath: String
    let country: Category
    let region: Category
    let subregion: Category
    let isInOcean: Bool
    let links: [Link]
    let embedded: [Embedded]

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

// MARK: - Embedded
struct Embedded: Codable {
    let isSourceAnArray: Bool
    let resources: [Resource]

    enum CodingKeys: String, CodingKey {
        case isSourceAnArray = "isSourceAnArray"
        case resources = "resources"
    }
}

// MARK: - Resource
struct Resource: Codable {
    let links: [Link]

    enum CodingKeys: String, CodingKey {
        case links = "_links"
    }
}

// MARK: - Link
struct Link: Codable {
    let curie: Curie
    let rel: String
    let href: String
    let title: String
    let type: String
    let deprecation: String
    let name: String
    let profile: String
    let hrefLang: String
    let isTemplated: Bool

    enum CodingKeys: String, CodingKey {
        case curie = "curie"
        case rel = "rel"
        case href = "href"
        case title = "title"
        case type = "type"
        case deprecation = "deprecation"
        case name = "name"
        case profile = "profile"
        case hrefLang = "hrefLang"
        case isTemplated = "isTemplated"
    }
}

// MARK: - Curie
struct Curie: Codable {
    let name: String
    let href: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case href = "href"
    }
}
