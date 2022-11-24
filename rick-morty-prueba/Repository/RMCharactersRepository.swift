//
//  OverFlightsRepository.swift
//  iss-location
//
//  Created by Tomas Ignacio Moyano on 19.11.22.
//

import Foundation

protocol RMCharactersRepository {
    func getRMCharacters(complete: @escaping (_ response:RMCharactersResponse?, _ error: String? )->())
}

class RMCharactersRepositoryWeb: RMCharactersRepository {

    let apiService: ApiServiceProtocol
    let jsonEncoder = JSONEncoder()
    
    init (apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }
    
    func getRMCharacters(complete: @escaping (RMCharactersResponse?, String?) -> ()) {
        
        let endpointURL = URL(string: "\(Constants.API_HOST)/api/characters")!

        apiService.getData(with: endpointURL) { (success, data, error) in
            
            if (success) {
                
                do {
                    let response = try JSONDecoder().decode(RMCharactersResponse.self, from: data!)
                    DispatchQueue.main.async {
                        complete(response, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        complete(nil, error.localizedDescription)
                    }
                }
                
            } else {
                
                DispatchQueue.main.async {
                    complete(nil, error)
                }
            }
        }
    }
}
