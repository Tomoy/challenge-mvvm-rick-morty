//
//  OverFlightsListViewModel.swift
//  iss-location
//
//  Created by Tomas Ignacio Moyano on 22.11.22.
//

import Foundation

class RMCharacterListViewModel: NSObject, RMCharacterListViewModelProtocol {
    var characters: Dynamic<[DomainRMCharacter]>
    var errorMessage: Dynamic<String>
    var totalCharacters: Dynamic<Int>
    let charactersRepository: RMCharactersRepository
    
    init(repository:RMCharactersRepository) {
        characters = Dynamic([])
        errorMessage = Dynamic("")
        totalCharacters = Dynamic(0)
        charactersRepository = repository
        super.init()
    }
    
    func fetchCharacters() {
        
        charactersRepository.getRMCharacters { response, error in
            if let resp = response {
                self.characters.value = resp.results.compactMap ({
                    DomainRMCharacter(name:$0.name, status: $0.status, species: $0.species, imageURL: $0.image)
                })
                self.totalCharacters.value = resp.info.count
            } else if let err = error {
                self.errorMessage.value = err
            }
        }
    }
}
