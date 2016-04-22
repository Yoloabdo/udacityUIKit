//
//  PokiCell.swift
//  PokiDo
//
//  Created by Abdulrhman  eaita on 4/22/16.
//  Copyright © 2016 Abdulrhman eaita. All rights reserved.
//

import UIKit

class PokiCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pockemon: Pokemon!
    
    func updateUI() {
        thumbImage.image = nil
        
        nameLabel.text = pockemon.name
        thumbImage.image = UIImage(named: "\(pockemon.pokedexId)")
    }
    
    override func awakeFromNib() {
        updateUI()
    }
}
