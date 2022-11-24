//
//  RMCharacterTableViewCell.swift
//  rick-morty-prueba
//
//  Created by Tomas Ignacio Moyano on 22.11.22.
//

import UIKit

class RMCharacterTableViewCell: UITableViewCell {

    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
        
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
        characterImageView.cancelImageLoad()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(cellModel:DomainRMCharacter) {
        characterNameLabel.text = cellModel.name
        characterImageView.loadImage(at: URL(string: cellModel.imageURL)!)
    }
}
