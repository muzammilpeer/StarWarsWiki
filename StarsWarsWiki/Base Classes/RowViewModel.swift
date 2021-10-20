//
//  RowViewModel.swift
//  StarsWarsWiki
//
//  Created by Salman Raza on 12/02/2021.
//

import Foundation

protocol CellTapDelegate {
    func cellTapped()
}

protocol RowViewModel: NSObject {
    var cellIdentifier: String { get }
    var cellTapDelegate: CellTapDelegate? { get set }
    
    func fetchData()
}
