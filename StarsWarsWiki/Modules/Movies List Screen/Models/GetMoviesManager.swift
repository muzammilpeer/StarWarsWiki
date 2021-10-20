//
//  GetMoviesManager.swift
//  StarsWarsWiki
//
//  Created by Salman Raza on 12/02/2021.
//

import UIKit
import Alamofire


class GetMoviesManager: NSObject {
    
    static func getMovies(urlString: String, completion: @escaping (GetMoviesResponseModel?, Error?) -> Void) {
        AF.request(urlString, method: .get)
            .validate()
            .responseDecodable { (response) in
                completion(response.value, response.error)
            }
    }
}
