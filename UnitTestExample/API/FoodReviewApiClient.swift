//
//  FoodReviewApiClient.swift
//  UnitTestExample
//
//  Created by ahmad shiddiq on 14/04/21.
//  Copyright © 2021 ahmad shiddiq. All rights reserved.
//

import Foundation

class FoodReviewApiClient {
    
    enum APIError: Error {
        case serviceError
    }
    
    func login(_ username: String, password: String, completionHandler: @escaping ([String: Any]?, Error?) -> Void) {
        guard let url = URL(string: "https://www.hungryhub.com/oauth/token.json") else {
            completionHandler(nil, APIError.serviceError)
            return
        }
        
        let bodyRequest: [String: Any] = ["grant_type": "password", "username": username, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: bodyRequest)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = ["Content-Type":"application/json", "X-HH-Language":"th-TH"]
        urlRequest.httpBody = jsonData
        
        
        execute(urlRequest, completionHandler: completionHandler)
    }
    
    private func execute(_ urlRequest: URLRequest, completionHandler: @escaping ([String: Any]?, Error?) -> Void) {
        
        let urlSession = URLSession.shared
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            guard let responseStatus = response as? HTTPURLResponse, responseStatus.statusCode == 200  else {
                completionHandler(nil, APIError.serviceError)
                return
            }
            
            guard let data = data, error == nil  else {
                completionHandler(nil, APIError.serviceError)
                return
            }
            
            do {
                guard let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    completionHandler(nil, APIError.serviceError)
                    return
                }
                completionHandler(jsonDictionary, nil)
            } catch {
                completionHandler(nil, error)
            }
        }
        
        dataTask.resume()

    }
}
