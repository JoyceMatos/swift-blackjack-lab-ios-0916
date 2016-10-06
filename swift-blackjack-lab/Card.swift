//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Joyce Matos on 9/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    var suit: String
    var rank: String
    var cardLabel: String
    var cardValue: UInt = 0
    var description: String {
        return "\(cardLabel)"
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        self.cardLabel = suit + rank
        self.cardValue = determineCardValue()
    }
    
    static func validSuits() -> [String] {
        var suitsArray = ["♠︎", "♥︎", "♦︎", "♣︎"]
        return suitsArray
    }
    
    static func validRanks() -> [String] {
        var ranksArray = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        return ranksArray
    }
    
    func determineCardValue() -> UInt {
        switch rank {
        case "A":
            return 1
        case "K", "Q", "J":
            return 10
        default:
            if let rank = UInt(rank) {
                return rank
            }
        }
        return 0
    }
}

func descriptionFor(cardArray: [Card]) -> String {
    var cardLabelString = ""
    for card in cardArray {
        cardLabelString += card.cardLabel
    }
    return cardLabelString
}












