//
//  ForecastLocationViewFactoryTests.swift
//  ForecastiOSAppTests
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation
import XCTest
@testable import ForecastiOSApp

class ForecastLocationViewFactoryTests: XCTestCase {
    
    func testThatMakeReturnForecastLocationView_When_Called() {
        //Given
        let sut = ForecastLocationViewFactory()
        
        //When
        let view = sut.make(location: .getMockLocation())
        
        //Then
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.viewModel)
    }
}
