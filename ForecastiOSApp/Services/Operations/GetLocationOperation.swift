//
//  GetForecastOperation.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 7/8/22.
//

import Foundation

class GetLocationOperation: APIOperation {
    typealias Completion = (Result<Location, Error>) -> Void
    typealias Builder = (String, @escaping GetLocationOperation.Completion) -> GetLocationOperation
    
    static let defaultBuilder: Builder = { (location: String, completion: @escaping Completion) in
        return GetLocationOperation(location: location, completionHandler: completion)
    }
    
    var completionHandler: Completion
    
    init(location: String, completionHandler: @escaping Completion) {
        let url = URLConstants.API.getLocationsURL(location: location)
        let request = APIOperation.createURLRequest(featureURL: url, method: .get)
        self.completionHandler = completionHandler
        
        super.init(request: request)
    }
    
    override func onError(statusCode: Int, error: Error, data: Data? = nil) {
        switch statusCode {
        case 0:
            self.completionHandler(.failure(APIError.timeout))
        case 401:
            self.completionHandler(.failure(APIError.unauthorized))
        case 403:
            self.completionHandler(.failure(APIError.invalidResponse))
        case 404:
            self.completionHandler(.failure(APIError.notFound))
        default:
            self.completionHandler(.failure(APIError.unknown(statusCode: statusCode)))
        }
    }
    
    override func onSuccess(statusCode: Int, data: Data?) {
        guard let data = data else {
            self.completionHandler(.failure(APIError.invalidResponse))
            return
        }
        
        do {
            let response = try JSONDecoder().decode(Location.self, from: data)
            self.completionHandler(.success(response))
        } catch {
            self.completionHandler(.failure(APIError.invalidResponse))
        }
    }
}
