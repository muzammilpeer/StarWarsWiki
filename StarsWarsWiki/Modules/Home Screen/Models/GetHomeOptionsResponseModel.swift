//
//	GetHomeOptionsResponseModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class GetHomeOptionsResponseModel : NSObject, Codable {

	let films : String?
	let people : String?
	let planets : String?
	let species : String?
	let starships : String?
	let vehicles : String?


	enum CodingKeys: String, CodingKey {
		case films = "films"
		case people = "people"
		case planets = "planets"
		case species = "species"
		case starships = "starships"
		case vehicles = "vehicles"
	}
    
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		films = try values.decodeIfPresent(String.self, forKey: .films)
		people = try values.decodeIfPresent(String.self, forKey: .people)
		planets = try values.decodeIfPresent(String.self, forKey: .planets)
		species = try values.decodeIfPresent(String.self, forKey: .species)
		starships = try values.decodeIfPresent(String.self, forKey: .starships)
		vehicles = try values.decodeIfPresent(String.self, forKey: .vehicles)
 	}


}
