//
//  Player.swift
//  wip
//
//  Created by Kristian Carter on 3/3/16.
//  Copyright © 2016 LateNightGames. All rights reserved.
//

import UIKit

class Player: NSObject, NSCoding {
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
    
    
    struct PropertyKey {
        static var strKey = "str"
        static var dexKey = "dex"
        static var  magicKey = "magic"
        static var  defKey = "def"
        static var  levelKey = "level"
        static var  healthKey = "health"
        static var  healthMaxKey = "healthMax"
        static var  sodaKey = "soda"
        static var  dietSodaKey = "dietSoda"
        static var  shockGumKey = "shockGum"
        static var  waterBalloonKey = "waterBalloon"
        static var  matchesKey = "matches"
        static var  nameKey = "name"
        static var  expKey = "exp"
        static var  levelUpKey = "levelUp"
        static var  perkPointKey = "prekPoint"
    }
    
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



    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        //This should load in all of the player variables
        aCoder.encodeInteger(str, forKey: PropertyKey.strKey)
        aCoder.encodeInteger(dex, forKey: PropertyKey.dexKey)
        aCoder.encodeInteger(magic, forKey: PropertyKey.magicKey)
        aCoder.encodeInteger(def, forKey: PropertyKey.defKey)
        aCoder.encodeInteger(level, forKey: PropertyKey.levelKey)
        aCoder.encodeInteger(health, forKey: PropertyKey.healthKey)
        aCoder.encodeInteger(healthMax, forKey: PropertyKey.healthMaxKey)
        aCoder.encodeInteger(soda, forKey: PropertyKey.sodaKey)
        aCoder.encodeInteger(dietSoda, forKey: PropertyKey.dietSodaKey)
        aCoder.encodeInteger(shockGum, forKey: PropertyKey.shockGumKey)
        aCoder.encodeInteger(waterBalloon, forKey: PropertyKey.waterBalloonKey)
        aCoder.encodeInteger(matches, forKey: PropertyKey.matchesKey)
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeInteger(exp, forKey: PropertyKey.expKey)
        aCoder.encodeInteger(levelUp, forKey: PropertyKey.levelUpKey)
        aCoder.encodeInteger(perkPoint, forKey: PropertyKey.perkPointKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        str = aDecoder.decodeObjectForKey(PropertyKey.strKey) as! Int
        dex = aDecoder.decodeObjectForKey(PropertyKey.dexKey) as! Int
    }
}
