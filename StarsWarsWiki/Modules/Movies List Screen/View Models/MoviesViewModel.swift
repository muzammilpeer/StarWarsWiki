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

class MoviesViewModel: NSObject {
    var moviesUrl: String
    var dataSource: Observable<[MovieCellViewModel]>?
    var movies: [Movie]?
    
    func fetchData() {
        GetMoviesManager.getMovies(urlString: moviesUrl, completion: { [weak self] (response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            self?.createDataSource(from: response)
        })
    }
    
    func createDataSource(from response: GetMoviesResponseModel?) {
        movies = response?.movies
        
        var dataSourceArray : [MovieCellViewModel] = []
        for movie in movies ?? [] {
            let movieCellViewModel = MovieCellViewModel.init(CellIdentifiers.MovieCellIdentifier, movie.title ?? "", movie.url ?? "")
            dataSourceArray.append(movieCellViewModel)
        }
        
        self.dataSource?.value = dataSourceArray
    }
    
    init(with url: String) {
        dataSource = Observable([])
        moviesUrl = url
    }
}
