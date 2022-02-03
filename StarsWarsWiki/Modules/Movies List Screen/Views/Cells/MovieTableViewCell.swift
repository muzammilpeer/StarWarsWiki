//
//  MovieTableViewCell.swift
//  StarsWarsWiki
//
//  Created by Muzammil Peer on 04/02/2022.
//

import UIKit

class MovieTableViewCell: BaseTableViewCell {
    
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
        
        if let viewModel = rowViewModel as? MovieCellViewModel {
            self.titleLabel.text = viewModel.titleText
        }
    }

}
