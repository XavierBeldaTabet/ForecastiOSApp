//
//  Link.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 7/8/22.
//

import Foundation

struct Link: Codable, Hashable {
    let curie: Curie?
    let rel: String?
    let href: String?
    let title: String?
    let type: String?
    let deprecation: String?
    let name: String?
    let profile: String?
    let hrefLang: String?
    let isTemplated: Bool?

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
