//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Joyce Matos on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
    
    var mustHit: Bool {
        if handscore < 17 {
            return true
        }
            return false
        stayed = true
    }

    override init(name: String) {
        super.init(name: name)
        tokens = 1000
    }
}
