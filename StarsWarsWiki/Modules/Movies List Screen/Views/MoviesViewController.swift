//
//  MoviesViewController.swift
//  StarsWarsWiki
//
//  Created by Salman Raza on 10/02/2021.
//

import UIKit

class MoviesViewController: UIViewController {
    var viewModel: MoviesViewModel?
    var dataSource: [RowViewModel]?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleUI()
        fillUI()
    }

    func styleUI() {
        tableView.tableFooterView = UIView()
    }
    
    func fillUI() {
        if isViewLoaded == false { return }
        
        if viewModel == nil { return }
        
        viewModel?.dataSource?.bind { [weak self] (items) in
            self?.dataSource = items
            self?.tableView.reloadData()
        }
        viewModel?.fetchData()
    }
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellViewModel = dataSource?[indexPath.row],
           let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier) as? BaseTableViewCell {
            cell.viewController = self
            cell.setupCell(cellViewModel)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if let cellViewModel = dataSource?[indexPath.row] {
            cellViewModel.cellTapDelegate?.cellTapped()
        }
    }
}

