//
//  URLRequestExtension.swift
//  MovieBrowser
//
//  Created by Santosh Bhandari on 10/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

extension URLRequest {
    
    static func createRequestWith(url: String, method: HTTPMethod) -> URLRequest? {
        
        let url = ApiList.baseUrl + url
        let apiUrl = appendApiKeyTo(url)

        guard let formattedURL = apiUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let finalURL = URL(string: formattedURL) else {
            print("Bad URL")
            return nil
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    static func appendApiKeyTo(_ url: String) -> String {
        
        var urlString = url
        if urlString.contains("?") {
            urlString.append("&api_key=\(Credentials.apiKey)")
        } else {
            urlString.append("?api_key=\(Credentials.apiKey)")
        }
        return urlString
    }
    
}
