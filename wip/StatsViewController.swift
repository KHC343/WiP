//
//  StatsViewController.swift
//  wip
//
//  Created by Kristian Carter on 3/3/16.
//  Copyright © 2016 LateNightGames. All rights reserved.
//

import UIKit
import Foundation

class StatsViewController: UIViewController {
    @IBOutlet weak var strAmount: UILabel!
    @IBOutlet weak var dexAmount: UILabel!
    @IBOutlet weak var defAmount: UILabel!
    @IBOutlet weak var magicAmount: UILabel!
    @IBOutlet weak var lvl: UILabel!
    @IBOutlet weak var expProgress: UIProgressView!
    @IBOutlet weak var strButton: UIButton!
    @IBOutlet weak var dexButton: UIButton!
    @IBOutlet weak var defButton: UIButton!
    @IBOutlet weak var magicButton: UIButton!
    @IBOutlet weak var characterHealthLabel: UILabel!
    @IBOutlet weak var level: UILabel!
    var player = Player()
    var whatLevel = Int()
    var inKombat = Bool()
    var enemy = Enemy()
    let prefs = NSUserDefaults.standardUserDefaults()


    override func viewDidLoad() {
        super.viewDidLoad()
        strAmount.text = String(player.str)
        dexAmount.text = String(player.dex)
        defAmount.text = String(player.def)
        magicAmount.text = String(player.magic)
        level.text = "Level: " + String(player.exp)
        lvl.text = String(player.exp)
        strButton.alpha = 0
        dexButton.alpha = 0
        defButton.alpha = 0
        magicButton.alpha = 0
        characterHealthLabel.text = String(player.health)
        if player.perkPoint > 0
        {
            lvlUp()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func lvlUp()
    {
        strButton.alpha = 1
        dexButton.alpha = 1
        defButton.alpha = 1
        magicButton.alpha = 0
        
        
    }
    @IBAction func strIncreaseButton(sender: AnyObject) {
        player.str += 1
        if player.perkPoint == 0
        {
            strButton.alpha = 0
            dexButton.alpha = 0
            defButton.alpha = 0
            magicButton.alpha = 0
        }
        player.perkPoint -= 1
        strAmount.text = String(player.str)
        dexAmount.text = String(player.dex)
        defAmount.text = String(player.def)
        magicAmount.text = String(player.magic)
    }
    @IBAction func dexIncreaseButton(sender: AnyObject) {
        player.dex += 1
        if player.perkPoint == 0
        {
            strButton.alpha = 0
            dexButton.alpha = 0
            defButton.alpha = 0
            magicButton.alpha = 0
        }
        player.perkPoint -= 0
        strAmount.text = String(player.str)
        dexAmount.text = String(player.dex)
        defAmount.text = String(player.def)
        magicAmount.text = String(player.magic)


    }
    @IBAction func defIncreaseButton(sender: AnyObject) {
        player.def += 1
        if player.perkPoint == 0
        {
            strButton.alpha = 0
            dexButton.alpha = 0
            defButton.alpha = 0
            magicButton.alpha = 0
        }
        
        player.perkPoint -= 0
        strAmount.text = String(player.str)
        dexAmount.text = String(player.dex)
        defAmount.text = String(player.def)
        magicAmount.text = String(player.magic)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! ViewController
        dvc.player = player
        dvc.whatLevel = whatLevel
        dvc.enemy = enemy
        dvc.inKombat = inKombat
        dvc.preference = prefs
    }
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        
        prefs.setValue(player.str, forKey: "strKey")
        prefs.setValue(player.dex, forKey: "dexKey")
        prefs.setValue(player.def, forKey: "defKey")
        prefs.setValue(player.magic, forKey: "magicKey")
        prefs.setValue(player.level, forKey: "levelKey")
        prefs.setValue(player.levelUp, forKey: "levelUpKey")
        prefs.setValue(player.exp, forKey: "expKey")
        prefs.setValue(player.health, forKey: "healthKey")
        prefs.setValue(player.healthMax, forKey: "healthMaxKey")
        prefs.setValue(player.soda, forKey: "sodaKey")
        prefs.setValue(player.dietSoda, forKey: "dietSodaKey")
        prefs.setValue(player.shockGum, forKey: "shockGumKey")
        prefs.setValue(player.waterBalloon, forKey: "waterBalloonKey")
        prefs.setValue(player.matches, forKey: "matchesKey")
        prefs.setValue(player.name
            , forKey: "nameKey")
        prefs.setValue(player.perkPoint, forKey: "perkPointKey")
        prefs.setValue(whatLevel, forKey: "whatLevelKey")
        print("I really wish that my dex was high than " + String(prefs.objectForKey("dexKey")!))
    }
}
