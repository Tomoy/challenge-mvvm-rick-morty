//
//  RMCharacterDetailViewController.swift
//  rick-morty-prueba
//
//  Created by Tomas Ignacio Moyano on 22.11.22.
//

import UIKit

class RMCharacterDetailViewController: UIViewController, Storyboarded {

    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterStatusLabel: UILabel!
    @IBOutlet weak var characterSpeciesLabel: UILabel!
    
    var model:DomainRMCharacter? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let theModel = model {
            characterNameLabel.text = theModel.name
            characterImageView.loadImage(at: URL(string: theModel.imageURL)!)
            characterStatusLabel.text = "Status: \(theModel.status)"
            characterSpeciesLabel.text = "Species: \(theModel.species)"
        }
    }
    
    func setModel(theModel:DomainRMCharacter) {
        model = theModel
    }
}
