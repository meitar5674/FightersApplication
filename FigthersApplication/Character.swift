//
//  Character.swift
//  FigthersApplication
//
//  Created by Meitar Basson on 29/05/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import Foundation

class Character {
    private var _name: String = "Player"
    private var _hp : Int = 100
    private var _att: Int = 10
    
    var name: String{
        get{
            return _name
        }
    }
    
    var hp: Int{
        get{
            return _hp
        }set(hp){
            _hp =  hp
        }
    }
    
    var att: Int{
        return _att
    }
    
    init (name: String, hp: Int, att: Int){
        _name = name
        _hp = hp
        _att = att
    }
    
    func isAlive() -> Bool{
        if _hp <= 0 {
            return false
        }
        return true
    }
    
    func Attack(opponentHp: Int) -> Int{
        return opponentHp - _att
    }
    
}