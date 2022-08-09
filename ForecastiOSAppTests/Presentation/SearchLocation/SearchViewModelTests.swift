//
//  SearchViewModelTests.swift
//  ForecastiOSAppTests
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation
@testable import ForecastiOSApp
import XCTest
import Cuckoo

class SearchViewModelTests: XCTestCase {
    
    var sut: SearchViewModel!
    var mockLocations: Locations!
    var searchViewRouter: MockSearchViewRouter!
    var expectationLocation: XCTestExpectation!
    var expectationLocations: XCTestExpectation!
    
    override func setUp() {
        expectationLocation = XCTestExpectation(description: "expectation for calling location")
        expectationLocations = XCTestExpectation(description: "expectation for calling locations")
        mockLocations = .getMockLocations()
        
        let mockGetLocationOperationBuilder: GetLocationOperation.Builder = { location, completion in
            let operation = MockGetLocationOperation(location: location, completionHandler: completion)
            operation.mockResultHandler = {
                self.expectationLocation.fulfill()
                return .success((.getMockLocation())!)
            }
            return operation
        }
        
        let mockGetLocationsOperationBuilder: GetLocationsOperation.Builder = { page, completion in
            let operation = MockGetLocationsOperation(page: page, completionHandler: completion)
            operation.mockResultHandler = {
                self.expectationLocations.fulfill()
                return .success(self.mockLocations)
            }
            return operation
        }
        
        searchViewRouter = MockSearchViewRouter(forecastLocationFactory: ForecastLocationViewFactory()).withEnabledSuperclassSpy()
        
        sut = SearchViewModel(getLocationsBuilder: mockGetLocationsOperationBuilder,
                              getLocationBuilder: mockGetLocationOperationBuilder,
                              searchViewRouter: searchViewRouter)
    }
    
    func testThatAllLocationsAreRetrieved_When_SearchViewModelIsInitialized() {

        //Then
        wait(for: [expectationLocations], timeout: 1)
        
    }
    
    func testThatFetchMoreLocationsRetrievesTheNextPage_When_ThereAreAvailablePages() {
        //Given
        XCTAssertTrue(sut.hasMorePages())
        expectationLocations.expectedFulfillmentCount = 2
        
        //When
        sut.fetchMoreLocations()
        
        //Then
        wait(for: [expectationLocations], timeout: 1)
    }
    
    func testThatLocationTappedCallsSearchRouter_When_IsCalled() {
        //Given
        let location = Location.getMockLocation()
        let view = ForecastLocationView(viewModel: ForecastLocationViewModel(location: location))
        stub(searchViewRouter) { stub in
            stub.navigateToForecastLocationView(location: any()).thenReturn(view)
        }
        
        //When
        let searchView = sut.locationTapped(location: location)
        
        //Then
        verify(searchViewRouter, times(1)).navigateToForecastLocationView(location: any())
        XCTAssertNotNil(searchView)
    }
    
}
