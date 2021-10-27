//
//  MovieListAM.swift
//  MovieBrowser
//
//  Created by Santosh Bhandari on 10/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

struct MovieResultAM: Codable {
    let results: [MovieAM]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct MovieAM: Codable {
    let identifier: Int
    let title: String
    let releaseDate: String?
    let voteAverage: Float
    let overview: String?
    let backdrop: String?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case overview
        case backdrop = "backdrop_path"
    }
}
