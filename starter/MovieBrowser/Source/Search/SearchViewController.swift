//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: String(describing: MovieTVCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MovieTVCell.self))
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    lazy var viewModel = MovieViewModel(delegate: self)

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? MovieDetailViewController, let indexPath = sender as? IndexPath {
            viewController.movie = viewModel.movies[indexPath.row]
        }
    }
    
    @IBAction func searchGoClicked() {
        if let text = searchBar.text {
            viewModel.searchMovieWith(query: text.lowercased())
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            viewModel.refresh()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            viewModel.searchMovieWith(query: text.lowercased())
            searchBar.resignFirstResponder()
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieTVCell.self), for: indexPath) as? MovieTVCell else {
            return UITableViewCell()
        }
        
        let movie = viewModel.movies[indexPath.row]
        cell.configureWith(movie: movie, imageSize: ImageSize.small)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "showMovieDetail", sender: indexPath)
    }
}

extension SearchViewController: StateProtocol {
    
    func initial() {
        
    }
    
    func errorWith(message: String) {
        DispatchQueue.main.async {
            self.view.showErrorWith(message: message)
        }
    }
    
    func loading() {
        DispatchQueue.main.async {
            self.tableView.isHidden = true
            self.view.showLoaderWith(message: "Loading Movies...")
        }
    }
    
    func success() {
        DispatchQueue.main.async {
            self.tableView.isHidden = false
            self.tableView.reloadData()
            self.tableView.refreshControl?.endRefreshing()
            self.view.hideLoader()
        }
    }
    
}
