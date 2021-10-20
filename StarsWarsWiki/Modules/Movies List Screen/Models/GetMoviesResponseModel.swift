//
//	GetMoviesResponseModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class GetMoviesResponseModel : Codable {

	let count : Int?
	let next : String?
	let previous : String?
	let movies : [Movie]?


	enum CodingKeys: String, CodingKey {
		case count = "count"
		case next = "next"
		case previous = "previous"
		case movies = "results"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		next = try values.decodeIfPresent(String.self, forKey: .next)
		previous = try values.decodeIfPresent(String.self, forKey: .previous)
        movies = try values.decodeIfPresent([Movie].self, forKey: .movies)
 	}


}
