

//
//  ViewController.swift
//  Concentration
//
//  Created by Artjola Meli on 9/14/20.
//  Copyright © 2020 Artjola Meli. All rights reserved.
//

import UIKit

class ViewController: UIViewController { //inheritance - :
    
    private lazy var game = Concentraiton(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private var numberOfPairsOfCards: Int {
           return (cardButtons.count + 1)/2
    }

    private var emojiChoices = ["🐻", "🥰", "❤️", "😎","🏀", "🐵", "🐶", "🍎","🥦", "🚘", "🍩", "👀","🐢", "🐙", "🐡", "🌼", "🤚🏻",
                                "🐥", "🐸", "🦀", "🐳", "🐓", "🐉", "🍀", "🎂", "🍺", "🇺🇸" ,"🔴"]

    private (set) var flipCount = 0  { didSet { flipCountLabel.text = "Flips: \(game.flipCount)" } }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private weak var scoreLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction func newGameButton(_ sender: UIButton) { //New game button Function
        gameOverAlert()
        game.reset()
        emoji.removeAll()
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
           flipCount += 1
        print("not working")
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
       private func updateViewFromModel(){
        
               //Update the Flip count
               flipCountLabel.text = "Flips: \(game.flipCount)"
               
               //Update the Score
               scoreLabel.text = "Score: \(game.score)"
                    
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                } else {
                    button.setTitle("", for: UIControl.State.normal)
                    if card.isMatched {
                        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                    }else {
                        button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)                    }
            }
        }
            
    }
    private var emoji = [Int:String]()
    
        func emoji(for card: Card) -> String {
            if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                let randomIndex = Int (arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
            
            return emoji[card.identifier] ?? "?"
        }
    private func gameOverAlert() {
           let alert = UIAlertController(title: "New Game", message: "Ready for a new Game??", preferredStyle: .alert)
           let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
              print("Ok button tapped")
           })
            alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
}




