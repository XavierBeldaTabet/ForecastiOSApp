//
//  Embedded.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 7/8/22.
//

import Foundation

struct Embedded: Codable {
    let isSourceAnArray: Bool
    let resources: [Resource]

    enum CodingKeys: String, CodingKey {
        case isSourceAnArray = "isSourceAnArray"
        case resources = "resources"
    }
}
