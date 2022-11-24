//
//  OverFlightsListViewModel.swift
//  iss-location
//
//  Created by Tomas Ignacio Moyano on 22.11.22.
//

import Foundation

protocol RMCharacterListViewModelProtocol {
    var characters: Dynamic<[DomainRMCharacter]> { get }
    var errorMessage: Dynamic<String> { get }
    var totalCharacters: Dynamic<Int> { get }
    func fetchCharacters()
    
}
