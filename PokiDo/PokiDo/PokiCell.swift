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
    
    
    var cellPoki: Pokemon! {
        didSet{
            updateUI()
        }
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        layer.cornerRadius = 5.0
        
    }
    
    
    func updateUI() {
        // resetting
        thumbImage?.image = nil
        
        //setting
        
        nameLabel?.text = cellPoki.pokeName ?? "test"
        thumbImage?.image = UIImage(named: "\(cellPoki.pokedexId)")
    }
    
}
