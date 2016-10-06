//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Joyce Matos on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    var deck = Deck()
    var house: House = House(name: "House")
    var player: House = House(name: "Player")
    var bet: UInt = 0

    func place(bet: UInt) -> Bool {
        if player.tokens >= bet {
            self.bet = bet
            return true
        }
        return false
    }
    
    func deal() {
        deck.shuffle()
        player.cards.removeAll()
        house.cards.removeAll()
        player.cards.append(deck.drawCard())
        player.cards.append(deck.drawCard())
        player.stayed = false
        house.cards.append(deck.drawCard())
        house.cards.append(deck.drawCard())
        house.stayed = false
        }
    
    func turn(house: House) {
        if house.mayHit == true && house.mustHit == true {
                house.cards.append(deck.drawCard())
        } else {
            house.stayed = true 
        }
        }
    
    
    func winner() -> String {
        if house.busted || player.cards.count == 5 || player.blackjack || house.stayed && player.stayed && player.handscore > house.handscore  {
            return "player"
        } else if house.handscore >= player.handscore && player.cards.count != 5 || player.busted || house.blackjack && player.cards.count != 5 {
            return "house"
        }
        return "no"
    }
    
    
    func award() -> String {
        switch winner() {
            case "player":
            player.didWin(bet: bet)
            house.didLose(bet: bet)
            return "player wins"
            break
            case "house":
            house.didWin(bet: bet)
            player.didLose(bet: bet)
            return "house wins"
            break
        default:
            return "There is no winner"
        }
        return ""
    }
    
    
    

}
