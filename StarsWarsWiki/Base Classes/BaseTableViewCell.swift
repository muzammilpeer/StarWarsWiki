//
//  BaseTableViewCell.swift
//  StarsWarsWiki
//
//  Created by Salman Raza on 12/02/2021.
//

import UIKit

class BaseTableViewCell: UITableViewCell, CellTapDelegate {
    var viewController: UIViewController?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(_ rowViewModel: RowViewModel) {
//        rowViewModel.cellTapDelegate = self
        
        //Override in child class to provide cell setup functionality if needed
    }
    
    func cellTapped() {
        //Override in child class to provide cell tap functionality if needed
    }
}
