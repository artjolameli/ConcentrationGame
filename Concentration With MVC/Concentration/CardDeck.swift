//
//  Card.swift
//  Concentration
//
//  Created by Artjola Meli on 9/16/20.
//  Copyright © 2020 Artjola Meli. All rights reserved.
//

import Foundation

struct CardDeck {
    
     var deck = [Card]()
    
    func isEmpty() -> Bool {
          return deck.count == 0 ? true : false
      }
    
    mutating func dealCard() -> Card? { //?if the deck is empty it wont return any card
        return self.isEmpty() ? nil : deck.remove(at: 0)
    }
    
    init(numberOfCardsToMatch: Int) {
    }
    
   
}
