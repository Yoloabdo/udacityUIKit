//
//  ViewController.swift
//  PokiDo
//
//  Created by Abdulrhman  eaita on 4/21/16.
//  Copyright © 2016 Abdulrhman eaita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: Variables
    
    var pokeData = [Pokemon]()
    
    // MARK: Outlets
    @IBOutlet weak var collictionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parsePokemonCSV()
    }
    
    //MARK: -DataSource setup
    
    func parsePokemonCSV() -> Void {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")
        
        do {
            let csvFile = try CSV(contentsOfURL: path!)
            for row in csvFile.rows {
                let pokeRow = Pokemon(name: row["identifier"]!, id: Int(row["id"]!)! )
                pokeData.append(pokeRow)
            }
        } catch {
            print("error loading data")
        }
        
    }
    

  // MARK: -CollictionView delegates
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokeData.count
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! PokiCell
        
        cell.cellPoki = pokeData[indexPath.row]
        return cell
        
    }
    
    
   
    
    
}

