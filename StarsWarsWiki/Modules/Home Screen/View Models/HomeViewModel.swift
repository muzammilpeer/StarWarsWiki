//
//  HomeViewModel.swift
//  StarsWarsWiki
//
//  Created by Salman Raza on 12/02/2021.
//

import Foundation

fileprivate enum CellIdentifiers {
    static let HomeOptionCellIdentifier = "HomeOptionTableViewCell"
}

protocol HomeViewUpdateDelegate
{
    func selectType(viewModel:HomeOptionCellViewModel)
}

class HomeViewModel {
    var dataSource: Observable<[HomeOptionCellViewModel]>?
    var homeOptions: GetHomeOptionsResponseModel?
    var delegate:HomeViewUpdateDelegate? = nil
    var localDataSource:[HomeOptionCellViewModel] = []
    init() {
        dataSource = Observable([])
    }
//    init(selection: @escaping () -> Void) {
//        self.select = selection
//        dataSource = Observable([])
//    }
    
    func fetchData() {
        GetHomeOptionsManager.getHomeOptions { [weak self] (response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            self?.createDataSource(from: response)
        }
    }
    
    func createDataSource(from response: GetHomeOptionsResponseModel?) {
        homeOptions = response
        localDataSource = []
        if let people = homeOptions?.people {
            let option = HomeOptionCellViewModel.init(CellIdentifiers.HomeOptionCellIdentifier, "People", people,selection: {})
            option.select = {
                [weak self] in
                self?.delegate?.selectType(viewModel: option)
            }
            localDataSource.append(option)
        }
        
        if let planets = homeOptions?.planets {
            let option = HomeOptionCellViewModel.init(CellIdentifiers.HomeOptionCellIdentifier, "Planets", planets,selection: {})
            option.select = {
                [weak self] in
                self?.delegate?.selectType(viewModel: option)
            }
            localDataSource.append(option)
        }
        
        if let films = homeOptions?.films {
            let option = HomeOptionCellViewModel.init(CellIdentifiers.HomeOptionCellIdentifier, "Films", films,selection: {})
            option.select = {
                [weak self] in
                self?.delegate?.selectType(viewModel: option)
            }
            localDataSource.append(option)
        }
        
        if let species = homeOptions?.species {
            let option = HomeOptionCellViewModel.init(CellIdentifiers.HomeOptionCellIdentifier, "Species", species,selection: {})
            option.select = {
                [weak self] in
                self?.delegate?.selectType(viewModel: option)
            }
            localDataSource.append(option)
        }
        
        if let vehicles = homeOptions?.vehicles {
            let option = HomeOptionCellViewModel.init(CellIdentifiers.HomeOptionCellIdentifier, "Vehicles", vehicles,selection: {})
            option.select = {
                [weak self] in
                self?.delegate?.selectType(viewModel: option)
            }
            localDataSource.append(option)
        }
        
        if let starships = homeOptions?.starships {
            let option = HomeOptionCellViewModel.init(CellIdentifiers.HomeOptionCellIdentifier, "Starships", starships,selection: {})
            option.select = {
                [weak self] in
                self?.delegate?.selectType(viewModel: option)
            }
            localDataSource.append(option)
        }
        
        self.dataSource?.value = localDataSource
        
    }
    
    
}
