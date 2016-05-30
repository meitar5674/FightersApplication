//
//  Knight.swift
//  FigthersApplication
//
//  Created by Meitar Basson on 29/05/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import Foundation

class Knight: Character {
    
    private var _criticalAttack: Int!
    private var _armor: Int!
    
    convenience init(criticalAtk: Int ,name: String, hp: Int, att: Int, armor: Int) {
        self.init(name: name, hp: hp, att: att)
        _criticalAttack = criticalAtk
        _armor = armor
    }
    
    func decreaseArmor(attackPower: Int) -> Int {
        var lastPower: Int = attackPower
        lastPower = attackPower - _armor
        if _armor > 0
        {
            _armor = _armor - attackPower
        }
        return lastPower
    }
}
