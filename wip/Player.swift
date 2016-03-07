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
    
    
    convenience init(str: Int, dex: Int, magic: Int, def: Int, health: Int, level: Int)
        
    {
        self.init()
        self.str = str
        self.dex = dex
        self.magic = magic
        self.def = def
        self.level = level
        self.health = health
    }


}
