//
//  MockRMCharactersRepository.swift
//  rick-morty-pruebaTests
//
//  Created by Tomas Ignacio Moyano on 23.11.22.
//

import Foundation
@testable import rick_morty_prueba

final class MockRMCharactersRepository: RMCharactersRepository {
    
    func getRMCharacters(complete: @escaping (RMCharactersResponse?, String?) -> ()) {
        let response = RMCharactersResponse(info: RMCharactersInfo(count: 10, pages: 2), results: [RMCharacter(name: "Tomas", status: "Alive", species: "Human", image: "http://google.com")])
        complete(response, nil)
    }
}


final class MockRMCharactersRepositoryWithError: RMCharactersRepository {
    
    func getRMCharacters(complete: @escaping (RMCharactersResponse?, String?) -> ()) {
        complete(nil, "Error 3")
    }
}
