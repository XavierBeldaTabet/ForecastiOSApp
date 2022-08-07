//
//  URLConstants.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 7/8/22.
//

struct URLConstants {
    struct API {
        static let baseURL = "https://www.yr.no/api/v0/"
        
        private static let locationsForecastURL = "locations/%@/forecast"
        static func getLocationsForecastByIdURL(id: String) -> String {
            return String(format: self.locationsForecastURL, id)
        }
        
        private static let locationsURL = "locations/path/%@"
        static func getLocationsURL(location: String) -> String {
            return String(format: self.locationsURL, location)
        }
    }
}
