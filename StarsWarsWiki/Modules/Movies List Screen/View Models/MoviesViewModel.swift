//
//  MoviesViewModel.swift
//  StarsWarsWiki
//
//  Created by Salman Raza on 12/02/2021.
//

import Foundation

fileprivate enum CellIdentifiers {
    static let MovieCellIdentifier = "MovieTableViewCell"
}

class MoviesViewModel {
    let moviesUrl: String
    var dataSource: Observable<[MovieCellViewModel]>?
    var localDataSource: [MovieCellViewModel] = []

    init(with url: String) {
        dataSource = Observable([])
        moviesUrl = url
    }
    
    func fetchData() {
        GetMoviesManager.getMovies(urlString: moviesUrl, completion: { [weak self] (response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            self?.createDataSource(from: response)
        })
    }
    
    func createDataSource(from response: GetMoviesResponseModel?) {
        if let moviesList = response?.movies {
            localDataSource = moviesList.map { items in
                MovieCellViewModel.init(CellIdentifiers.MovieCellIdentifier, items.title ?? items.name ?? "", items.url ?? "")
            }
            
            self.dataSource?.value = localDataSource
        }
    }
    
}
