//
//	Movie.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Movie : Codable {

	let characters : [String]?
	let created : String?
	let director : String?
	let edited : String?
	let episodeId : Int?
	let openingCrawl : String?
	let planets : [String]?
	let producer : String?
	let releaseDate : String?
	let species : [String]?
	let starships : [String]?
	let title : String?
	let url : String?
	let vehicles : [String]?


	enum CodingKeys: String, CodingKey {
		case characters = "characters"
		case created = "created"
		case director = "director"
		case edited = "edited"
		case episodeId = "episode_id"
		case openingCrawl = "opening_crawl"
		case planets = "planets"
		case producer = "producer"
		case releaseDate = "release_date"
		case species = "species"
		case starships = "starships"
		case title = "title"
		case url = "url"
		case vehicles = "vehicles"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		characters = try values.decodeIfPresent([String].self, forKey: .characters)
		created = try values.decodeIfPresent(String.self, forKey: .created)
		director = try values.decodeIfPresent(String.self, forKey: .director)
		edited = try values.decodeIfPresent(String.self, forKey: .edited)
		episodeId = try values.decodeIfPresent(Int.self, forKey: .episodeId)
		openingCrawl = try values.decodeIfPresent(String.self, forKey: .openingCrawl)
		planets = try values.decodeIfPresent([String].self, forKey: .planets)
		producer = try values.decodeIfPresent(String.self, forKey: .producer)
		releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
		species = try values.decodeIfPresent([String].self, forKey: .species)
		starships = try values.decodeIfPresent([String].self, forKey: .starships)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		vehicles = try values.decodeIfPresent([String].self, forKey: .vehicles)
 	}


}
