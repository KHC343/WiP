//
//  ViewController.swift
//  wip
//
//  Created by Kristian Carter on 3/2/16.
//  Copyright © 2016 LateNightGames. All rights reserved.
//

import UIKit
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
    var inKombat = Bool()
    var player = Player()
    let activityManager = CMMotionActivityManager()
    var days:[String] = []
    var stepsTaken = Int()
    var stepper = CMPedometer()
    var enemy = Enemy()
    let date = NSDate()
    let calendar = NSCalendar.currentCalendar()
    var whichViewSwitch = Int()
    var left = String()
    var straight = String()
    var right = String()
    var whatDifficultly = Int()
    
    class Date {
        let calendar = NSCalendar.currentCalendar()
        var day: Int {
            return  calendar.component(.Day, fromDate: NSDate())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                self.stepsTaken = (data?.numberOfSteps.integerValue)!
                
                self.player.dex + 1
            }
            else
            {
                self.stepsTaken += 1
                print(self.stepsTaken)
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
                var roll2 = Int(arc4random_uniform(3)) + player.str % 2
                print(roll2)
                roll2 = roll2 - enemy.def
                print("withdodge")
                print(roll2)
                if roll2 <= 0
                {
                    
                }
                else
                {
                    enemy.health = enemy.health - roll2
                    print(enemy.health)
                    enemyHealthAmount.text = String(enemy.health)
                    enemyHealthBar.progress = Float(enemy.health)
                    mainTextView.text = "you dealt " + String(roll2) + " damgae"
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
                       
                        if player.exp == player.levelUp
                        {
                            player.perkPoint = 1
                            player.levelUp += 100
                        }
                    }
                }
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
                    
                }
                else
                {
                    player.health = player.health - roll2
                    print(enemy.health)
                    healthAmount.text = String(player.health)
                    mcHealthBar.progress = Float(player.health)
                    mainTextView.text = "you took " + String(roll2) + " damge"
                    if player.health == 0
                    {
               
                    }
                }
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
        
        if roll1 <= 30{
            enemy = Enemy(dmg: 1, dex: 1, isMagic: false, mdmg: 0, def: 1, name: "Dinkuh", health: 10)
            combatScreenSet()
            inKombat = true
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
            enemy = Enemy(dmg: 1, dex: 1, isMagic: false, mdmg: 0, def: 1, name: "Dinkuh", health: 10)
            combatScreenSet()
            inKombat = true
        }
        else
        {
            randomItemEvent()
        }

    }
    
    func highDif()
    {
        let roll1 =  Int(arc4random_uniform(100)) + 1
        
        if roll1 <= 80{
            enemy = Enemy(dmg: 1, dex: 1, isMagic: false, mdmg: 0, def: 1, name: "Dinkuh", health: 10)
            combatScreenSet()
            inKombat = true
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
        }
        else if whichViewSwitch == 2
        {
            let odvc = segue.destinationViewController as! ItemViewController
            odvc.player = player
            odvc.enemy = enemy
            odvc.inKombat = inKombat

        }
    }
}