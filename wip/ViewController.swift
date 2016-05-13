//
//  ViewController.swift
//  wip
//
//  Created by Kristian Carter on 3/2/16.
//  Copyright © 2016 LateNightGames. All rights reserved.
//

import UIKit
import Foundation
import CoreMotion

class ViewController: UIViewController {
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var enemyHealthBar: UIProgressView!
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var mcHealthBar: UIProgressView!
    @IBOutlet weak var attackButton: UIButton!
    @IBOutlet weak var itemButton: UIButton!
    @IBOutlet weak var runButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var enemyNameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var healthAmount: UILabel!
    @IBOutlet weak var enemyHealthAmount: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var straightButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var whatFloor: UILabel!
    var whatLevel = Int()
    var enemiesDefeated = Int ()
    var inKombat = Bool()
    var player = Player()
    let activityManager = CMMotionActivityManager()
    var stepper = CMPedometer()
    var enemy = Enemy()
    let date = NSDate()
    let calendar = NSCalendar.currentCalendar()
    var whichViewSwitch = Int()
    var left = String()
    var straight = String()
    var right = String()
    var whatDifficultly = Int()
    var preference = NSUserDefaults()
    var loadOrSave = Int()
    var savedPlayer : Player = Player()
    
    class Date {
        let calendar = NSCalendar.currentCalendar()
        var day: Int {
            return  calendar.component(.Day, fromDate: NSDate())
        }
    }
    
    override func viewDidLoad() {
        print(NSThread.callStackSymbols())

        super.viewDidLoad()
        if loadOrSave == 1
        {
            whatLevel == 1
        }
        else if loadOrSave == 2
        {
            player.str = Int(preference.objectForKey("strKey")! as! NSNumber)
            player.dex = Int(preference.objectForKey("dexKey")! as! NSNumber)
            player.def = Int(preference.objectForKey("defKey")! as! NSNumber)
            player.magic = Int(preference.objectForKey("magicKey")! as! NSNumber)
            player.level = Int(preference.objectForKey("levelKey")! as! NSNumber)
            player.levelUp = Int(preference.objectForKey("levelUpKey")! as! NSNumber)
            player.exp = Int(preference.objectForKey("expKey")! as! NSNumber)
            player.health = Int(preference.objectForKey("healthKey")! as! NSNumber)
            player.healthMax = Int(preference.objectForKey("healthMaxKey")! as! NSNumber)
            player.soda = Int(preference.objectForKey("sodaKey")! as! NSNumber)
            player.dietSoda = Int(preference.objectForKey("dietSodaKey")! as! NSNumber)
            player.shockGum = Int(preference.objectForKey("shockGumKey")! as! NSNumber)
            player.waterBalloon = Int(preference.objectForKey("wateBballoon")! as! NSNumber)
            player.matches = Int(preference.objectForKey("matchesKey")! as! NSNumber)
            player.name = String(preference.objectForKey("nameKey")! as! NSNumber)
            player.perkPoint = Int(preference.objectForKey("perkPointKey")! as! NSNumber)
            whatLevel = Int(preference.objectForKey("whatLevelKey")! as! NSNumber)
        }
        attackButton?.alpha = 0
        runButton?.alpha = 0
        continueButton?.alpha = 0
        healthAmount.text = String(player.health)
        let cal = NSCalendar.currentCalendar()
          let comps = cal.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: NSDate())
        comps.hour = 0
        comps.minute = 0
        comps.second = 0
        let timeZone = NSTimeZone.systemTimeZone()
        cal.timeZone = timeZone
        whichViewSwitch = 0
        pathSettings()
        stepper.startPedometerUpdatesFromDate(date) { (data, error) -> Void in
            print(data?.numberOfSteps.integerValue)
            if data?.numberOfSteps.intValue > 0
            {
                self.player.dex + 1
            }
            else
            {
                self.player.dex = 2
            }
        }
        
        if self.inKombat == true
        {
            combatScreenSet()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func attack(sender: AnyObject) {
        let roll1 = Int(arc4random_uniform(10)) + 1
        let hitChance = roll1 + player.dex
    
        if hitChance >= 5
        {
            let roll3 = Int(arc4random_uniform(10)) + 1
            let dodgeChance = roll3 + enemy.dex
            print("dodge")
            print(dodgeChance)
            
            if dodgeChance >= 5
            {
                var roll2 = Int(arc4random_uniform(3)) + player.str / 2
                print(roll2)
                roll2 = roll2 - enemy.def
                print("withdodge")
                print(roll2)
                if roll2 <= 0
                {
                    mainTextView.text = "They managed to dodge your attack."
                }
                else
                {
                    enemy.health = enemy.health - roll2
                    print(enemy.health)
                    enemyHealthAmount.text = String(enemy.health)
                    enemyHealthBar.progress = Float(enemy.health)
                    mainTextView.text = "they managed to avoid the majority of your attack you dealt " + String(roll2) + " damage"
                    if enemy.health <= 0
                    {
                        enemyNameLabel.text = " "
                        enemyHealthAmount.text = " "
                        enemyHealthBar.alpha = 0
                        attackButton.alpha = 0
                        runButton.alpha = 0
                        inKombat = false
                        player.exp += 10
                        straightButton.alpha = 1
                        rightButton.alpha = 1
                        leftButton.alpha = 1
                        pathSettings()
                        enemiesDefeated += 1
                       
                        if player.exp == player.levelUp
                        {
                            player.perkPoint = 1
                            player.levelUp += 100
                        }
                    }
                }
        }
            else
            {
                let roll2 = Int(arc4random_uniform(3)) + player.str / 2
                enemy.health = enemy.health - roll2
                print(enemy.health)
                enemyHealthAmount.text = String(enemy.health)
                enemyHealthBar.progress = Float(enemy.health)
                mainTextView.text = "dead on hit you dealt " + String(roll2) + " damage"

            }
        }
       enemyTurn()
    }

    func enemyTurn()
    {
        let roll1 = Int(arc4random_uniform(10)) + 1
        let hitChance = roll1 + enemy.dex
        
        if hitChance >= 5
        {
            let roll3 = Int(arc4random_uniform(10)) + 1
            let dodgeChance = roll3 + player.dex
            print("dodge")
            print(dodgeChance)
            
            if dodgeChance >= 5
            {
                var roll2 = Int(arc4random_uniform(3)) + 1
                print(roll2)
                roll2 = roll2 - player.def
                print("withdodge")
                print(roll2)
                if roll2 <= 0
                {
                    mainTextView.text = "you managed to dodge their attack."

                }
                else
                {
                    player.health = player.health - roll2
                    print(enemy.health)
                    healthAmount.text = String(player.health)
                    mcHealthBar.progress = Float(player.health)
                    mainTextView.text = "you managed to avoid most of the damage you took " + String(roll2) + " damage"
                    if player.health == 0
                    {
                        mainTextView.text = "GAME OVER"
                        healthAmount.alpha = 0
                        mcHealthBar.alpha = 0
                        runButton.alpha = 0
                        attackButton.alpha = 0
                        itemButton.alpha = 0
                        statsButton.alpha = 0
                    }
                }
            }
            else
            {
                let roll2 = Int(arc4random_uniform(3)) + enemy.dmg / 2
                player.health = player.health - roll2
                print(player.health)
                healthAmount.text = String(player.health)
                mcHealthBar.progress = Float(player.health)
                mainTextView.text = "dead on hit they dealt " + String(roll2) + " damage"
            }
        }
    }
    
    @IBAction func itemButtonOnPush(sender: AnyObject) {
        whichViewSwitch = 2
    }
    
    @IBAction func statsButtonOnPush(sender: AnyObject) {
        whichViewSwitch = 1
    }
    
    func combatScreenSet()
    {
        
        self.enemyNameLabel.text = String(self.enemy.name)
        self.enemyHealthAmount.text = String(self.enemy.health)
        self.enemyHealthBar.progress = Float(self.enemy.health)
        self.healthAmount.text = String(self.player.health)
        self.attackButton.alpha = 1
        self.runButton.alpha = 1
        self.rightButton.alpha = 0
        self.leftButton.alpha = 0
        self.straightButton.alpha = 0
    }
    
    func randomItemEvent()
    {
        let roll1 =  Int(arc4random_uniform(2)) + 1
        if roll1 == 1
        {
            player.dietSoda += 1
            mainTextView.text = "You found a dietsoda"
        }
        else if roll1 == 2
        {
            player.soda += 1
            mainTextView.text = "You found a soda"

        }
    }
    
    @IBAction func leftButtonOnPush(sender: AnyObject) {
        if right == "low"
        {
            lowDif()
        }
        else if right == "med"
        {
            medDif()
        }
        else
        {
            highDif()
        }

    }
    
    @IBAction func straightButtonOnPush(sender: AnyObject) {
        if right == "low"
        {
            lowDif()
        }
        else if right == "med"
        {
            medDif()
        }
        else
        {
            highDif()
        }

    }
    
    @IBAction func rightButtonOnPush(sender: AnyObject) {
        if right == "low"
        {
            lowDif()
        }
        else if right == "med"
        {
            medDif()
        }
        else
        {
            highDif()
        }

    }
    
    func lowDif()
    {
        let roll1 =  Int(arc4random_uniform(100)) + 1
        
        if roll1 <= 30
        {
            enemy = Enemy(dmg: 1, dex: 1, isMagic: false, mdmg: 0, def: 1, name: "An irregular Ant", health: 5)
            combatScreenSet()
            inKombat = true
            if whatLevel > 1
            {
            let roll1 =  Int(arc4random_uniform(4)) + 1
                if roll1 == 1
                {
                    enemy.dmg += 2
                    enemy.health *= whatLevel
                }
                if roll1 == 2
                {
                    enemy.dex += 2
                    enemy.health *= whatLevel
                }
                if roll1 == 3
                {
                    enemy.def += 2
                    enemy.health *= whatLevel
                }
            }
        }
        else if roll1 >= 40 && roll1 <= 50
        {
            if enemiesDefeated >= 3
            {
                whatLevel += 1
                whatFloor.text = String(whatLevel)
                enemiesDefeated = 0
            }
            else
            {
                lowDif()
            }

        }
        else
        {
            randomItemEvent()
        }

    }
    
    func medDif()
    {
        let roll1 =  Int(arc4random_uniform(100)) + 1
        
        if roll1 <= 50{
            enemy = Enemy(dmg: 1, dex: 1, isMagic: false, mdmg: 0, def: 1, name: "A mildly intimidating Ant", health: 7)
            combatScreenSet()
            inKombat = true
            if whatLevel > 1
            {
                let roll1 =  Int(arc4random_uniform(4)) + 1
                if roll1 == 1
                {
                    enemy.dmg += 2
                    enemy.health *= whatLevel
                }
                if roll1 == 2
                {
                    enemy.dex += 2
                    enemy.health *= whatLevel
                }
                if roll1 == 3
                {
                    enemy.def += 2
                    enemy.health *= whatLevel
                }
            }
            else if roll1 >= 60 && roll1 <= 70
            {
                if enemiesDefeated >= 3
                {
                    whatLevel += 1
                    whatFloor.text = String(whatLevel)
                    enemiesDefeated = 0
                }
                else
                {
                    medDif()
                }
            }

        }
        else
        {
            randomItemEvent()
        }

    }
    
    func highDif()
    {
        let roll1 =  Int(arc4random_uniform(100)) + 1
        
        if roll1 <= 70{
            enemy = Enemy(dmg: 1, dex: 1, isMagic: false, mdmg: 0, def: 1, name: "A disturbingly aggresive Ant", health: 10)
            combatScreenSet()
            inKombat = true
            if whatLevel > 1
            {
                let roll1 =  Int(arc4random_uniform(4)) + 1
                if roll1 == 1
                {
                    enemy.dmg += whatLevel
                    enemy.health *= whatLevel
                }
                if roll1 == 2
                {
                    enemy.dex += whatLevel
                    enemy.health *= whatLevel
                }
                if roll1 == 3
                {
                    enemy.def += whatLevel
                    enemy.health *= whatLevel
                }
            }

        }
        else if roll1 >= 80 && roll1 <= 90
        {
            if enemiesDefeated >= 3
            {
            whatLevel += 1
            whatFloor.text = String(whatLevel)
                enemiesDefeated = 0
            }
            else
            {
                highDif()
            }

            
        }
        else
        {
            randomItemEvent()
        }

    }
    
    func pathSettings()
    {
        let roll1 = Int(arc4random_uniform(3)) + 1
        if roll1 == 1
        {
            left = "low"
        }
        else if roll1 == 2
        {
            left = "med"
        }
        else
        {
            left = "high"
        }
        
        let roll3 = Int(arc4random_uniform(3)) + 1
        if roll3 == 1
        {
            straight = "low"
        }
        else if roll1 == 2
        {
            straight = "med"
        }
        else
        {
            straight = "high"
        }
        
        let roll2 = Int(arc4random_uniform(3)) + 1
        if roll2 == 1
        {
            right = "low"
        }
        else if roll2 == 2
        {
            right = "med"
        }
        else
        {
            right = "high"
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if whichViewSwitch == 0
        {
            let dvc = segue.destinationViewController as! StatsViewController
            dvc.player = player
            dvc.enemy = enemy
            dvc.inKombat = inKombat
            dvc.whatLevel = whatLevel
        }
        else if whichViewSwitch == 2
        {
            let odvc = segue.destinationViewController as! ItemViewController
            odvc.player = player
            odvc.enemy = enemy
            odvc.inKombat = inKombat
            odvc.whatLevel = whatLevel


        }
    }
 
}