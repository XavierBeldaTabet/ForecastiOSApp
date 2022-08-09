//
//  APIOperation.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 7/8/22.
//

import Foundation

enum APIMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

struct APIError: Error, Equatable {
    
    static let noConnection = APIError(.noConnection, statusCode: 0)
    static let timeout = APIError(.timeout, statusCode: 1)
    static let unauthorized = APIError(.unauthorized, statusCode: 401)
    static let invalidResponse = APIError(.invalidResponse, statusCode: 403)
    static let notFound = APIError(.notFound, statusCode: 404)
    static let serverNotReachable = APIError(.serverNotReachable, statusCode: 500)

    static func unknown(statusCode: Int) -> APIError {
        return APIError(.unknown, statusCode: statusCode)
    }
    
    enum Kind: Equatable {
        case noConnection
        case invalidResponse
        case serverNotReachable
        case notFound // 404
        case timeout
        case unauthorized
        case unknown
    }
    
    let kind: Kind
    let statusCode: Int
    
    private init(_ kind: Kind, statusCode: Int) {
        self.kind = kind
        self.statusCode = statusCode
    }
}

class APIOperation: BaseOperation {
    static let timeoutInterval = 5.0
    
    var request: URLRequest
    var task: URLSessionDataTask?
    var session = URLSession.shared

    init(request: URLRequest) {
        self.request = request
    }
    
    private static func generateURL(urlStr: String) -> URL {
        let urlString = URLConstants.API.baseURL + urlStr
        return URL(string: urlString)!
    }
    
    static func createURLRequest(featureURL: String, method: APIMethod, body: Data? = nil, headers: [String: String] = [:]) -> URLRequest {
        let url = self.generateURL(urlStr: featureURL)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.timeoutInterval = APIOperation.timeoutInterval
        return request
    }
    
    override func main() {
        guard NetworkChecker.isReachable() else {
            self.isExecuting = false
            self.isFinished = true
            self.onError(statusCode: 0, error: APIError.noConnection)
            return
        }
        
        let handlerBlock: (Data?, URLResponse?, Error?) -> Void = { data, response, networkError in
            defer {
                self.isExecuting = false
                self.isFinished = true
            }
            
            if self.isCancelled {
                return
            }
            
            if let error = networkError as? URLError, error.code == .notConnectedToInternet {
                self.onError(statusCode: 0, error: APIError.noConnection)
                return
            }
            
            guard let httpStatus = response as? HTTPURLResponse else {
                self.onError(statusCode: 0, error: APIError.timeout)
                return
            }
            
            var error = networkError
            if !(200...204 ~= httpStatus.statusCode),
               error == nil {
                error = NSError(domain: "", code: httpStatus.statusCode, userInfo: nil)
            }
            
            if let error = error {
                DispatchQueue.main.async {
                    self.onError(statusCode: httpStatus.statusCode, error: error, data: data)
                }
                
                return
            }
            
            self.onSuccess(statusCode: httpStatus.statusCode, data: data)
        }
        
        let newTask = self.session.dataTask(with: self.request, completionHandler: handlerBlock)
        
        newTask.resume()
        self.task = newTask
    }
    
    override func cancel() {
        super.cancel()
        self.task?.cancel()
    }
    
    func onError(statusCode: Int, error: Error, data: Data? = nil) {}
    func onSuccess(statusCode: Int, data: Data?) {}
}
