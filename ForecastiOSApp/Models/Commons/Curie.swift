//
//  Curie.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 7/8/22.
//

import Foundation

struct Curie: Codable {
    let name: String?
    let href: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case href = "href"
    }
}
