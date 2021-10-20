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

class HomeViewModel: NSObject {
    var dataSource: Observable<[HomeOptionCellViewModel]>?
    var homeOptions: GetHomeOptionsResponseModel?
    
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
        
        var dataSourceArray : [HomeOptionCellViewModel] = []
        
        if let people = homeOptions?.people {
            let option = HomeOptionCellViewModel.init(CellIdentifiers.HomeOptionCellIdentifier, "People", people)
            dataSourceArray.append(option)
        }
        
        if let planets = homeOptions?.planets {
            let option = HomeOptionCellViewModel.init(CellIdentifiers.HomeOptionCellIdentifier, "Planets", planets)
            dataSourceArray.append(option)
        }
        
        if let films = homeOptions?.films {
            let option = HomeOptionCellViewModel.init(CellIdentifiers.HomeOptionCellIdentifier, "Films", films)
            dataSourceArray.append(option)
        }
        
        if let species = homeOptions?.species {
            let option = HomeOptionCellViewModel.init(CellIdentifiers.HomeOptionCellIdentifier, "Species", species)
            dataSourceArray.append(option)
        }
        
        if let vehicles = homeOptions?.vehicles {
            let option = HomeOptionCellViewModel.init(CellIdentifiers.HomeOptionCellIdentifier, "Vehicles", vehicles)
            dataSourceArray.append(option)
        }
        
        if let starships = homeOptions?.starships {
            let option = HomeOptionCellViewModel.init(CellIdentifiers.HomeOptionCellIdentifier, "Starships", starships)
            dataSourceArray.append(option)
        }
        
        self.dataSource?.value = dataSourceArray
    }
    
    override init() {
        dataSource = Observable([])
    }
}
