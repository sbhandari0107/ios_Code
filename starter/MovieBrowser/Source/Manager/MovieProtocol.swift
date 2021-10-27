//
//  MovieProtocol.swift
//  MovieBrowser
//
//  Created by Santosh Bhandari on 10/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

protocol MovieProtocol {
    func searchMovieWith(query: String, completion: @escaping ([Movie]) -> Void, failure: @escaping (String) -> Void)
}
