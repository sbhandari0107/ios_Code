//
//  ApiList.swift
//  MovieBrowser
//
//  Created by Santosh Bhandari on 10/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

struct ApiList {
    static let baseUrl = "https://api.themoviedb.org/3/"
    static let searchMovie = "search/movie?query=%@"
    static let getMovieDetail = "movie/%d"
    static let imageBaseUrl = "https://image.tmdb.org/t/p/w%d"
}

struct Credentials {
    static let apiKey = "5885c445eab51c7004916b9c0313e2d3"
}
