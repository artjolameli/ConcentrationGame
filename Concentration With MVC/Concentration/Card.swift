//
//  Card.swift
//  Concentration
//
//  Created by Artjola Meli on 9/16/20.
//  Copyright © 2020 Artjola Meli. All rights reserved.
//

import Foundation

//has no inheritance like a class, its a valued type not a reference type
struct Card {
    
    var identifier: Int //what is on the card- every card has an identifier
    var isFaceUp  = false
    var isMatched = false
    var isEmpty   = false
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
    identifierFactory += 1
    return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        
    }
}

