//
//  MovieViewModel.swift
//  MovieBrowser
//
//  Created by Santosh Bhandari on 10/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieViewModel {
    
    var movies: [Movie] = []
    
    var state: State = .initial {
        didSet {
            switch state {
            case .loading:
                delegate?.loading()
            case .success:
                delegate?.success()
            case .error(let message):
                delegate?.errorWith(message: message)
            case .initial:
                delegate?.initial()
            }
        }
    }
    
    let delegate: StateProtocol?
    let manager: MovieProtocol
    
    init(delegate: StateProtocol, manager: MovieProtocol = MovieManager()) {
        self.delegate = delegate
        self.manager = manager
    }
    
    func viewLoaded() {
        state = .initial
    }
    
    func refresh() {
        movies.removeAll()
        self.state = .success
    }
    
    func searchMovieWith(query: String) {
        state = .loading
        
        manager.searchMovieWith(query: query, completion: { [weak self] movies in
            guard let self = self else {
                return
            }
            self.movies = movies
            self.state = .success
        }, failure: { [weak self] errorMsg in
            guard let self = self else {
                return
            }
            self.state = .error(errorMsg)
        })
    }
}
