//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var synopsisLbl: UILabel!
    @IBOutlet weak var posterImgV: UIImageView!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        
        self.movieTitleLbl.text = movie.title
        self.posterImgV.loadImageUsingCacheWith(movie.backdropURL)
        self.releaseDateLbl.text = movie.releaseDate
        self.synopsisLbl.text = movie.overview
    }
    
}
