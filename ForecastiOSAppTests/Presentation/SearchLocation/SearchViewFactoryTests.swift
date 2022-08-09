//
//  SearchViewFactoryTests.swift
//  ForecastiOSAppTests
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation
@testable import ForecastiOSApp
import XCTest

class SearchViewFactoryTests: XCTestCase {
    
    func testThatSearchViewIsReturned_When_MakeIsCalled() {
        //Given
        let sut = SearchViewFactory()
        
        //When
        let view = sut.make()
        
        //Then
        XCTAssertNotNil(view)
    }
}
