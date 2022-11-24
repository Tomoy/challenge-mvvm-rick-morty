//
//  OverFlight.swift
//  iss-location
//
//  Created by Tomas Ignacio Moyano on 22.11.22.
//

import Foundation
import UIKit

struct RMCharactersResponse: Codable {
    let info: RMCharactersInfo
    let results: [RMCharacter]
}

struct RMCharactersInfo: Codable {
    let count: Int
    let pages: Int
}

struct RMCharacter:Codable {
    
    let name: String
    let status: String
    let species: String
    let image: String
}
