//
//  HomeOptionTableViewCell.swift
//  StarsWarsWiki
//
//  Created by Muzammil Peer on 04/02/2022.
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
    
    func setupCell(_ viewModel: HomeOptionCellViewModel) {
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.titleText ?? ""
    }

    override func cellTapped() {
        if viewModel?.titleText?.lowercased() == "films" {
            let viewModel = MoviesViewModel.init(with: viewModel?.actionUrlString ?? "")
            let viewController = MoviesViewController.init(viewModel:viewModel)
            viewController.show(viewController, sender: viewController)
//            if let viewController = storyboard.instantiateViewController(identifier: "MoviesViewController") as? MoviesViewController {
//                viewController.viewModel = viewModel?.getMoviesViewModel()
//                self.viewController?.navigationController?.pushViewController(viewController, animated: true)
//            }
        }
    }
}
