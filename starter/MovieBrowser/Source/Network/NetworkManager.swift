//
//  NetworkManager.swift
//  MovieBrowser
//
//  Created by Santosh Bhandari on 10/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

enum HTTPMethod: String {
    case get = "GET"
}

class NetworkManager: NSObject, URLSessionDelegate, NSURLConnectionDataDelegate {

    func callWith<T: Decodable >(request: URLRequest, completion: @escaping (Result<T, AppError>) -> (Void)) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: OperationQueue.main)

        let task = session.dataTask(with: request, completionHandler: { data, _, error -> Void in
            if let error = error {
                print("API - \(request.url!) Error - \(error.localizedDescription)")
                completion(.failure(.networkError(error.localizedDescription)))
            } else {
                print("API - \(request.url!) Response")
                if let decodedResponse: T = data?.decode() {
                    completion(.success(decodedResponse))
                } else {
                    completion(.failure(.networkError(AppMessage.standardError)))
                }
            }
        })
        
        task.resume()
    }

}
