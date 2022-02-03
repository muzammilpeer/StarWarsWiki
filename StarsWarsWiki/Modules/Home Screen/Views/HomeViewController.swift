//
//  HomeViewController.swift
//  StarsWarsWiki
//
//  Created by Muzammil Peer on 04/02/2022.
//

import UIKit

class HomeViewController: UIViewController {
    let viewModel: HomeViewModel
//    var dataSource: [RowViewModel]?

    @IBOutlet weak var tableView: UITableView!
    
    @available(*, unavailable, renamed: "init(viewModel:coder:)")
    required init?(coder: NSCoder) {
        fatalError("This class does not support NSCoder")
    }

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        let bundle = Bundle.main
        super.init(nibName: String.init(describing: HomeViewController.self), bundle: bundle)
        self.viewModel.delegate = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleUI()
        fillUI()
        
//        self.viewModel.select =  { [weak self] in
//            let viewModel = MoviesViewModel.init(with: self.viewModel.actionUrlString ?? "")
//            let viewController = MoviesViewController.init(viewModel:viewModel)
//            viewController.show(viewController, sender: viewController)
//
//        }

    }

    func styleUI() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "HomeOptionTableViewCell", bundle: .main), forCellReuseIdentifier: "HomeOptionTableViewCell")
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

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource?.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellViewModel = viewModel.dataSource?.value[indexPath.row],
           let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier) as? HomeOptionTableViewCell {
//            cell.viewController = self
            cell.setupCell(cellViewModel)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if let cellViewModel = viewModel.dataSource?.value[indexPath.row] {
            cellViewModel.select()
        }
    }
    
}

extension HomeViewController : HomeViewUpdateDelegate
{
    func selectType(viewModel: HomeOptionCellViewModel) {
        let movieViewModel = MoviesViewModel.init(with: viewModel.actionUrlString ?? "")
        let viewController = MoviesViewController.init(viewModel:movieViewModel)
        self.show(viewController, sender: self)
    }
    
    
}
