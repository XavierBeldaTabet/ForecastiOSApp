//
//  Resource.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 7/8/22.
//

import Foundation

struct Resource: Codable, Hashable {
    let links: [Link]

    enum CodingKeys: String, CodingKey {
        case links = "_links"
    }
}
