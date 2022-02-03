//
//  MoviesViewController.swift
//  StarsWarsWiki
//
//  Created by Muzammil Peer on 04/02/2022.
//

import UIKit

class MoviesViewController: UIViewController {
    private let viewModel: MoviesViewModel
//    private var dataSource: [MovieCellViewModel]?

    @IBOutlet weak var tableView: UITableView!
    
    @available(*, unavailable, renamed: "init(viewModel:coder:)")
    required init?(coder: NSCoder) {
        fatalError("This class does not support NSCoder")
    }

    init(viewModel: MoviesViewModel) {
        self.viewModel = viewModel
        let bundle = Bundle.main
        super.init(nibName: String.init(describing: MoviesViewController.self), bundle: bundle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleUI()
        fillUI()
    }

    func styleUI() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: .main), forCellReuseIdentifier: "MovieTableViewCell")

    }
    
    func fillUI() {
        if isViewLoaded == false { return }
        
        viewModel.dataSource?.bind { [weak self] (items) in
            self?.viewModel.dataSource?.value = items
            self?.tableView.reloadData()
        }
        viewModel.fetchData()
    }
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.dataSource?.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellViewModel = self.viewModel.dataSource?.value[indexPath.row],
           let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier) as? BaseTableViewCell {
            cell.viewController = self
            cell.setupCell(cellViewModel)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if let cellViewModel = self.viewModel.dataSource?.value[indexPath.row] {
            cellViewModel.cellTapDelegate?.cellTapped()
        }
    }

}
