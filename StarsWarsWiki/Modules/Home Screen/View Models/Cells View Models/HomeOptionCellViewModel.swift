//
//  HomeOptionCellViewModel.swift
//  StarsWarsWiki
//
//  Created by Salman Raza on 12/02/2021.
//

import Foundation

class HomeOptionCellViewModel: BaseCellViewModel {
    var titleText: String?
    var actionUrlString: String?
    
    init(_ identifier: String, _ title: String, _ actionUrl: String) {
        super.init(identifier)
        titleText = title
        actionUrlString = actionUrl
    }
    
    func getMoviesViewModel() -> MoviesViewModel {
        return MoviesViewModel.init(with: self.actionUrlString ?? "")
    }
}
