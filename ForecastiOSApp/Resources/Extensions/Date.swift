//
//  Date.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.string(from: self)
    }
    
    func toDayString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        return formatter.string(from: self)
    }
}
