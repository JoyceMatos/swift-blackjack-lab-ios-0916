//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Joyce Matos on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var cards: [Card] = [] // Needs to be initialized
    var handscore: UInt {
        get {
            var totalScore = 0
            for card in cards {
                if card.rank == "2" {
                    totalScore += 2
                }
                else if card.rank == "3" {
                    totalScore += 3
                }
                else if card.rank == "4" {
                    totalScore += 4
                }
                else if card.rank == "5" {
                    totalScore += 5
                }
                else if card.rank == "6" {
                    totalScore += 6
                }
                else if card.rank == "7" {
                    totalScore += 7
                }
               else if  card.rank == "8" {
                    totalScore += 8
                }
                else if card.rank == "9" {
                    totalScore += 9
                }
                else if card.rank == "10" {
                    totalScore += 10
                }
                else if card.rank == "J" {
                    totalScore += 10
                }
                else if card.rank == "Q" {
                    totalScore += 10
                }
                else if card.rank == "K" {
                    totalScore += 10
                }
                else if card.rank == "A" {
                    totalScore += 11
                    while totalScore > 21 {
                        totalScore -= 10
                    }
                }
            }
            return UInt(totalScore)
        }
        set {
            handscore = newValue
        }
        
    }
    
    var blackjack: Bool {
        if handscore == 21 && cards.count == 2 {
        return true
        }
            return false
    }
    var busted: Bool {
        if handscore > 21 {
            return true
        }
        return false
    }
    
    var stayed: Bool = false
    var mayHit: Bool {
        get {
            if busted == false && blackjack == false && stayed == false {
                return true
            }
            return false
        }
            set {
                mayHit = newValue
        
            }
        }
  
    var tokens: UInt = 100
    var description: String {
        return "Player: \(name), Cards: \(cards), Handscore: \(handscore), Blackjack: \(blackjack), Busted: \(busted), Stayed: \(stayed), Tokens: \(tokens)"
    }
    
    init(name: String) {
        self.name = name
        self.tokens = 100
    }

func canPlace(bet: UInt) -> Bool {
    if bet <= 100 {
        return true
    }
    return false
}
    func didWin(bet: UInt) {
        tokens += bet
    }
    
    func didLose(bet: UInt) {
        tokens -= bet
    }
    
    
    
    
    
    
}
