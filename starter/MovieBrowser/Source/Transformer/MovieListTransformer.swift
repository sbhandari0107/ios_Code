//
//  MovieListTransformer.swift
//  MovieBrowser
//
//  Created by Santosh Bhandari on 10/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieListTransformer {

    static func transform(_ movieList: [MovieAM]) -> [Movie] {
        
        var movies: [Movie] = []
        
        for movie in movieList {
            var date: String = "Not Available"
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            if let releaseDate = movie.releaseDate, let dateResult = dateFormatter.date(from: releaseDate) {
                dateFormatter.dateFormat = "MMMM dd, yyyy"
                let formattedDate = dateFormatter.string(from: dateResult)
                date = formattedDate
            }
            
            var backdropURL: URL?
            if let backdrop =  movie.backdrop {
                let imageUrl = String(format: ApiList.imageBaseUrl, ImageSize.medium.rawValue) + backdrop
                backdropURL = URL(string: imageUrl)
            }
            
            movies.append(Movie(identifier: movie.identifier,
                                title: movie.title,
                                releaseDate: date,
                                rating: "\(movie.voteAverage)",
                                overview: movie.overview ?? "",
                                backdropURL: backdropURL))
        }
        
        return movies
    }
}
