//
//  URLConstants.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 7/8/22.
//

struct URLConstants {
    struct API {
        static let baseURL = "https://www.yr.no/api/v0/"
        
        private static let locationsForecastURL = "locations/%@/forecast?language=en"
        static func getLocationForecastByIdURL(id: String) -> String {
            return String(format: self.locationsForecastURL, id)
        }
        
        private static let locationsURL = "locations/path/%@?language=en"
        static func getLocationsURL(location: String) -> String {
            return String(format: self.locationsURL, location)
        }
        
        private static let allLocationsURL = "locations?language=en&page=%d"
        static func getAllLovationURL(page: Int) -> String {
            return String(format: self.allLocationsURL, page)
        }
    }
}
