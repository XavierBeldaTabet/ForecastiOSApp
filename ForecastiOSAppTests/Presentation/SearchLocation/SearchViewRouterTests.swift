//
//  SearchViewRouter.swift
//  ForecastiOSAppTests
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation
@testable import ForecastiOSApp
import XCTest
import Cuckoo

class SearchViewRouterTests: XCTestCase {
    
    func testThatForecastLocationViewIsReturned_When_NavigateToForecastLocationViewIsCalled() {
        //Given
        let location = Location.getMockLocation()
        let mockForecastFactory = MockForecastLocationViewFactoryInterface()
        
        stub(mockForecastFactory) { stub in
            when(stub.make(location: any()).thenReturn(ForecastLocationView(viewModel: ForecastLocationViewModel(location: location))))
        }
        let sut = SearchViewRouter(forecastLocationFactory: mockForecastFactory)
        
        //When
        let view = sut.navigateToForecastLocationView(location: location)
        
        //Then
        XCTAssertNotNil(view)
    }
}
