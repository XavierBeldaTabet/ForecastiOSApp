//
//  GetLocations.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 8/8/22.
//

import Foundation

class GetLocationsOperation: APIOperation {
    typealias Completion = (Result<Locations, Error>) -> Void
    typealias Builder = (Int, @escaping GetLocationsOperation.Completion) -> GetLocationsOperation
    
    static let defaultBuilder: Builder = { (page: Int, completion: @escaping Completion) in
        return GetLocationsOperation(page: page, completionHandler: completion)
    }
    
    var completionHandler: Completion
    
    init(page: Int, completionHandler: @escaping Completion) {
        let url = URLConstants.API.getAllLovationURL(page: page)
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
            let response = try JSONDecoder().decode(Locations.self, from: data)
            self.completionHandler(.success(response))
        } catch {
            self.completionHandler(.failure(APIError.invalidResponse))
        }
    }
}
