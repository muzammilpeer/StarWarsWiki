//
//  HomeOptionTableViewCell.swift
//  StarsWarsWiki
//
//  Created by Salman Raza on 12/02/2021.
//

import UIKit

class HomeOptionTableViewCell: BaseTableViewCell {
    var viewModel: HomeOptionCellViewModel?

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupCell(_ rowViewModel: RowViewModel) {
        super.setupCell(rowViewModel)
        
        viewModel = rowViewModel as? HomeOptionCellViewModel
        
        self.titleLabel.text = viewModel?.titleText ?? ""
    }

    override func cellTapped() {
        if viewModel?.titleText?.lowercased() == "films" {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            if let viewController = storyboard.instantiateViewController(identifier: "MoviesViewController") as? MoviesViewController {
                viewController.viewModel = viewModel?.getMoviesViewModel()
                self.viewController?.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}
