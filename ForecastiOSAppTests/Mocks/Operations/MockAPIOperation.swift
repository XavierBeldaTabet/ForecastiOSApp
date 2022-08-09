//
//  MockAPIOperation.swift
//  ForecastiOSAppTests
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation

@testable import ForecastiOSApp

protocol MockApiOperation: APIOperation {
    associatedtype T
    associatedtype ErrorType: Error
    
    var completionHandler: (Result<T, ErrorType>) -> Void { get }
    var mockResult: Result<T, ErrorType>? { get set }
    var mockResultHandler: (() -> Result<T, ErrorType>)? { get set }
}

extension MockApiOperation {
    func mockMain() {
        guard let mockResult = self.mockResult ?? self.mockResultHandler?() else {
            fatalError("To mock the execution of the APIOperation you need to either ")
        }
        self.completionHandler(mockResult)
        self.isExecuting = false
        self.isFinished = true
    }
}
