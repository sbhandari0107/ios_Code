//
//  AppError.swift
//  MovieBrowser
//
//  Created by Santosh Bhandari on 10/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

enum AppError: Error {
    case badURL
    case networkError(String)
    
    var description: String {
        switch self {
        case .badURL:
            return "Bad Url"
        case .networkError(let message):
            return message
        }
    }
}
