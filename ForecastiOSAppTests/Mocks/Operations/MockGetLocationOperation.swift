//
//  MockGetLocationOperation.swift
//  ForecastiOSAppTests
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation
@testable import ForecastiOSApp

class MockGetLocationOperation: GetLocationOperation, MockApiOperation {
    var mockResult: Result<Location, Error>?
    var mockResultHandler: (() -> Result<Location, Error>)?
    
    override func main() {
        self.mockMain()
    }
}
