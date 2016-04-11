//
//  Player.swift
//  wip
//
//  Created by Kristian Carter on 3/3/16.
//  Copyright © 2016 LateNightGames. All rights reserved.
//

import UIKit

class Player: NSObject {
    var str = Int()
    var dex = Int()
    var magic = Int()
    var def = Int()
    var level = Int()
    var health = Int()
    var healthMax = Int()
    var soda = Int()
    var dietSoda = Int()
    var shockGum = Int()
    var waterBalloon = Int()
    var matches = Int()
    var name = String()
    var exp = Int()
    var levelUp = Int()
    var perkPoint = Int()
    
    convenience init(str: Int, dex: Int, magic: Int, def: Int, health: Int, level: Int, soda: Int, dietSoda: Int, shockGum: Int, waterBalloon: Int, matches: Int, healthMas: Int, name: String, exp: Int, levelUp: Int, perkPoint: Int)
        
    {
        self.init()
        self.str = str
        self.dex = dex
        self.magic = magic
        self.def = def
        self.level = level
        self.health = health
        self.healthMax = healthMas
        self.soda = soda
        self.dietSoda = dietSoda
        self.shockGum = shockGum
        self.waterBalloon = waterBalloon
        self.matches = matches
        self.name = name
        self.exp = exp
        self.levelUp = levelUp
        self.perkPoint = perkPoint
    }


}
