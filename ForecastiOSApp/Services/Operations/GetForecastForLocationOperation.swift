//
//  GetForecastForLocationOperation.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 7/8/22.
//

import Foundation

class GetForecastForLocationOperation: APIOperation {
    typealias Completion = (Result<Forecast, Error>) -> Void
    typealias Builder = (String, @escaping GetForecastForLocationOperation.Completion) -> GetForecastForLocationOperation
    
    static let defaultBuilder: Builder = { (locationId: String, completion: @escaping Completion) in
        return GetForecastForLocationOperation(locationId: locationId, completionHandler: completion)
    }
    
    var completionHandler: Completion
    
    init(locationId: String, completionHandler: @escaping Completion) {
        let url = URLConstants.API.getLocationForecastByIdURL(id: locationId)
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
            let response = try JSONDecoder().decode(Forecast.self, from: data)
            self.completionHandler(.success(response))
        } catch {
            self.completionHandler(.failure(APIError.invalidResponse))
        }
    }
}
