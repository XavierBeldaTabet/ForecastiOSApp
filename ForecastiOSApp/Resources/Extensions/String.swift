//
//  String.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation


extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: self) ?? Date()
    }
}
