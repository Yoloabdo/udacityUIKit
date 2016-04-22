//
//  ViewController.swift
//  PokiDo
//
//  Created by Abdulrhman  eaita on 4/21/16.
//  Copyright © 2016 Abdulrhman eaita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var collictionView: UICollectionView! 
  
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! PokiCell
        
        cell.cellPoki = Pokemon(name: "Celloke", id: indexPath.row + 1)
        return cell
        
    }
    
    
   
    
    
}

