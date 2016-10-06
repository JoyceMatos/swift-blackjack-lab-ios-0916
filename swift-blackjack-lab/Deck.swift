//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Joyce Matos on 10/2/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    private var undealtCards: [Card]
    
    private var dealtCards: [Card]
    
    var description: String {
        return "Cards Remaining: \(undealtCards.count), Cards Dealt: \(dealtCards.count)"
    }
    
    init() {
        undealtCards = []
        dealtCards = []
        
        for suit in Card.validSuits(){
            for rank in Card.validRanks(){
                undealtCards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    func drawCard() -> Card {
        let topcard = undealtCards.removeLast()
        dealtCards.append(topcard)
        return topcard
    }
    
    func shuffle() {
        undealtCards.append(contentsOf: dealtCards)
        dealtCards.removeAll()
        var undealtArray = [Card]()
        for timesInTheLoop in 0..<undealtCards.count {
            let randomIndex = Int(arc4random_uniform(UInt32(undealtCards.count-1)))
            let nextCard = undealtCards[randomIndex]
            undealtArray.append(nextCard)
            undealtCards.remove(at: randomIndex)
        }
        undealtCards = undealtArray
    }
}



