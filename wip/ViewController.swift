//
//  ViewController.swift
//  wip
//
//  Created by Kristian Carter on 3/2/16.
//  Copyright © 2016 LateNightGames. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var enemyHealthBar: UIProgressView!
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var mcHealthBar: UIProgressView!
    @IBOutlet weak var attackButton: UIButton!
    @IBOutlet weak var itemButton: UIButton!
    @IBOutlet weak var tempWayToCauseEventToFireButton: UIButton!
    @IBOutlet weak var runButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var enemyNameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var healthAmount: UILabel!
    @IBOutlet weak var enemyHealthAmount: UILabel!
    var player = Player()
    var enemy = Enemy()

    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player(str: 1, dex: 1, magic: 0, def: 1, health: 10, level: 0)
        attackButton?.alpha = 0
        runButton?.alpha = 0
        continueButton?.alpha = 0
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func tempWayToCauseEventToFire(sender: AnyObject) {
        //let roll1 =  Int(arc4random_uniform(100)) + 1 (later set up percentages we agreed on.)
        enemy = Enemy(dmg: 1, dex: 1, isMagic: false, mdmg: 0, def: 1, name: "Ant", health: 10)
        enemyNameLabel.text = String(enemy.name)
        enemyHealthAmount.text = String(enemy.health)
        enemyHealthBar.progress = Float(enemy.health)
        attackButton.alpha = 1
        runButton.alpha = 1
        tempWayToCauseEventToFireButton.alpha = 0
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
                    if enemy.health <= 0
                    {
                        enemyNameLabel.text = " "
                        enemyHealthAmount.text = " "
                        enemyHealthBar.alpha = 0
                        attackButton.alpha = 0
                        runButton.alpha = 0
                        tempWayToCauseEventToFireButton.alpha = 1

                        
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
                    if player.health == 0
                    {
               
                    }
                }
            }
        }
    }
}

