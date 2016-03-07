//
//  Enemy.swift
//  wip
//
//  Created by Kristian Carter on 3/3/16.
//  Copyright © 2016 LateNightGames. All rights reserved.
//

import UIKit

class Enemy: NSObject {
    var dmg = Int()
    var mdmg = Int()
    var dex = Int()
    var isMagic = Bool()
    var def = Int()
    var name = String()
    var health = Int()
    
    
    convenience init(dmg: Int, dex: Int, isMagic: Bool, mdmg: Int, def: Int, name: String, health: Int)
        
    {
        self.init()
        self.dmg = dmg
        self.dex = dex
        self.isMagic = isMagic
        self.def = def
        self.mdmg = mdmg
        self.name = name
        self.health = health
        
    }


}
