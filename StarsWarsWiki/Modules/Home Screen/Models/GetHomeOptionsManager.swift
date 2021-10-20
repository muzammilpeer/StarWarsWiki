//
//  GetHomeOptionsManager.swift
//  StarsWarsWiki
//
//  Created by Salman Raza on 12/02/2021.
//

import UIKit
import Alamofire

enum ApiPaths {
    static let GetHomeOptions = "https://swapi.dev/api/"
}

class GetHomeOptionsManager: NSObject {
    
    static func getHomeOptions(completion: @escaping (GetHomeOptionsResponseModel?, Error?) -> Void) {
        AF.request(ApiPaths.GetHomeOptions, method: .get)
            .validate()
            .responseDecodable { (response) in
                completion(response.value, response.error)
            }
    }
}
