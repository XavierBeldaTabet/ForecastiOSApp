//
//  ForecastLocationViewModelTests.swift
//  ForecastiOSAppTests
//
//  Created by Belda, Xavier on 6/8/22.
//

import XCTest
@testable import ForecastiOSApp
import Cuckoo

class ForecastLocationViewModelTests: XCTestCase {
    
    var mockLocation: Location!
    var mockforecast: Forecast!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockLocation = .getMockLocation()
        mockforecast = .getMockForecast()
    }
    
    func testThatOnInitGetForecastForLocationIsCalled() {
        //Given
        let expectation = XCTestExpectation(description: "Calling for forecast in a location")
        let builder: GetForecastForLocationOperation.Builder = { location, completion in
            let operation = MockGetForecastForLocationOperation(locationId: location, completionHandler: completion)
            operation.mockResultHandler = {
                expectation.fulfill()
                return.success(.getMockForecast())
            }
            return operation
        }
        
        //When
        let _ = ForecastLocationViewModel(location: .getMockLocation(), getForecastBuilder: builder)
        
        //Then
        wait(for: [expectation], timeout: 1)
    }
}
