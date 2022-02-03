//
//  HomeOptionCellViewModel.swift
//  StarsWarsWiki
//
//  Created by Salman Raza on 12/02/2021.
//

import Foundation

class HomeOptionCellViewModel {
    
    public var cellIdentifier: String
    var titleText: String?
    var actionUrlString: String?
    var select: () -> Void
    
    init(_ identifier: String, _ title: String, _ actionUrl: String,selection: @escaping () -> Void ) {
        cellIdentifier = identifier
        titleText = title
        actionUrlString = actionUrl
        select = selection
    }
    
    func getMoviesViewModel() -> MoviesViewModel {
        return MoviesViewModel.init(with: self.actionUrlString ?? "")
    }
}
