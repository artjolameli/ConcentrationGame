//
//  Concentration.swift
//  Concentration
//
//  Created by Artjola Meli on 9/14/20.
//  Copyright © 2020 Artjola Meli. All rights reserved.
//


import Foundation

class Concentraiton {
    
    private(set) var cards = [Card]()
        
    private var witnessedCards = [Card]()
    
    private(set) var flipCount = 0
    
    private(set) var score = 0;
    
    
   private var indexOfOneAndOnlyFaceUp: Int? {
    get {
        var foundIndex : Int?
        for index in cards.indices {
            if cards[index].isFaceUp {
                if foundIndex == nil {
                    foundIndex = index
                } else {
                    foundIndex = nil
                }
            }
        }
        return foundIndex
    }
        set(newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
        }
    }
}
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            
            if let matchIndex = indexOfOneAndOnlyFaceUp, matchIndex != index {
                
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                      score += 2
                }
                cards[index].isFaceUp = true
            }else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                indexOfOneAndOnlyFaceUp = index
            }
        }else {
            if cards[index].isEmpty {
              cards[index].isMatched = false
              cards[index].isFaceUp = false
            }
        }
  }

    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
        let card = Card()
            cards += [card, card]
     }
       // TODO: Shuffe the deck of cards
               var lastCardIndex = cards.count - 1;
               
               while lastCardIndex > 0 {
                   let randomIndex = Int(arc4random_uniform(UInt32(lastCardIndex)))
                   cards.swapAt(randomIndex, lastCardIndex)
                   lastCardIndex -= 1
        }
    }
    
    //TODO: Reset/Start a New Game the Game
    func reset() {
        flipCount = 0
        score = 0
        for index in 0..<cards.count {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        witnessedCards.removeAll()
    }
    
 
}
    

