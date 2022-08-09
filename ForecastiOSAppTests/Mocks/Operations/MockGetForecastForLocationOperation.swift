//
//  MockGetForecastForLocationOperation.swift
//  ForecastiOSAppTests
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation

@testable import ForecastiOSApp

class MockGetForecastForLocationOperation: GetForecastForLocationOperation, MockApiOperation {
    var mockResult: Result<Forecast, Error>?
    var mockResultHandler: (() -> Result<Forecast, Error>)?

    override func main() {
        self.mockMain()
    }
    
}
