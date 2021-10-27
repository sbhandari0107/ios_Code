//
//  MovieManager.swift
//  MovieBrowser
//
//  Created by Santosh Bhandari on 10/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieManager: MovieProtocol {
    
    lazy var manager = NetworkManager()
    
    func searchMovieWith(query: String, completion: @escaping ([Movie]) -> Void, failure: @escaping (String) -> Void) {
        
        let url = String(format: ApiList.searchMovie, query)
        guard let request = URLRequest.createRequestWith(url: url, method: .get) else {
            failure(AppMessage.standardError)
            return
        }
        
        manager.callWith(request: request, completion: { (result: Result<MovieResultAM, AppError>) in
            switch result {
            case .success(let response):
                let movies = MovieListTransformer.transform(response.results)
                completion(movies)
            case .failure(let error):
                failure(error.description)
            }
        })
    }
}
