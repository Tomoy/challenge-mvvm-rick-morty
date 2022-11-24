//
//  characters_list_view_model.swift
//  rick-morty-pruebaTests
//
//  Created by Tomas Ignacio Moyano on 23.11.22.
//

import XCTest
@testable import rick_morty_prueba

class characters_list_view_model: XCTestCase {

    var viewModel: RMCharacterListViewModel!
    var repository: RMCharactersRepository!
    
    override func setUp() {
        repository = MockRMCharactersRepository()
        viewModel = RMCharacterListViewModel(repository: repository)
    }
    
    func testGetCharacters () {
        viewModel.fetchCharacters()
        XCTAssertEqual(viewModel.characters.value[0].name, "Tomas")
        XCTAssertEqual(viewModel.characters.value[0].status, "Alive")
    }
    
    func testTotalCharacters () {
        viewModel.fetchCharacters()
        XCTAssertEqual(viewModel.totalCharacters.value, 10)
    }
    
    func testErrorMessageEmpty() {
        viewModel.fetchCharacters()
        XCTAssertEqual(viewModel.errorMessage.value, "")
    }
    
    func testErrorMessageNotEmpty() {
        repository = MockRMCharactersRepositoryWithError()
        viewModel = RMCharacterListViewModel(repository: repository)
        viewModel.fetchCharacters()
        XCTAssertEqual(viewModel.errorMessage.value, "Error 3")
    }
}
