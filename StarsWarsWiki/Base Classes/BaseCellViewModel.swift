//
//  BaseCellViewModel.swift
//  StarsWarsWiki
//
//  Created by Salman Raza on 12/02/2021.
//

import Foundation

class BaseCellViewModel: RowViewModel {
    var cellIdentifier: String
    var cellTapDelegate: CellTapDelegate?
    
    func fetchData() {
        //Override in child class to provide data fetching functionality if needed
    }
    
    init(_ identifier: String) {
        cellIdentifier = identifier
    }
}
