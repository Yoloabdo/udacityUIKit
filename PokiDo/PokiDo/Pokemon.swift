//
//  File.swift
//  PokiDo
//
//  Created by Abdulrhman  eaita on 4/21/16.
//  Copyright © 2016 Abdulrhman eaita. All rights reserved.
//

import Foundation
class Pokemon {
    private let _name: String!
    private let _pokedexId: Int!
    
    var pokeName: String {
        get{
            return _name
        }
    }
    
    var pokedexId: Int {
        get{
            return _pokedexId
        }
    }
    
    init (name: String, id: Int) {
        _name = name
        _pokedexId = id
    }
    
    
}