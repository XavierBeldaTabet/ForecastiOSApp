//
//  MockGetLocationsOperation.swift
//  ForecastiOSAppTests
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation
@testable import ForecastiOSApp

class MockGetLocationsOperation: GetLocationsOperation, MockApiOperation {
    var mockResult: Result<Locations, Error>?
    var mockResultHandler: (() -> Result<Locations, Error>)?
    
    override func main() {
        self.mockMain()
    }
}
