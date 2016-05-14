//
//  ItemViewController.swift
//  wip
//
//  Created by Kristian Carter on 3/3/16.
//  Copyright © 2016 LateNightGames. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    @IBOutlet weak var dietSodaAmount: UILabel!
    @IBOutlet weak var sodaAmount: UILabel!
    @IBOutlet weak var matchAmount: UILabel!
    @IBOutlet weak var shockGumAmount: UILabel!
    @IBOutlet weak var waterBalloonAmount: UILabel!
    @IBOutlet weak var dietSodaButton: UIButton!
    @IBOutlet weak var sodaButton: UIButton!
    @IBOutlet weak var shockGumButton: UIButton!
    @IBOutlet weak var waterBalloonButton: UIButton!
    @IBOutlet weak var matchButton: UIButton!
    var player = Player()
    var inKombat = Bool()
    var enemy = Enemy()
    var whatLevel = Int()
    var whatMagicType = Int()
    var usedMagic = Bool()
    var usedItem = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dietSodaAmount.text = String(player.dietSoda)
        sodaAmount.text = String(player.soda)
        shockGumAmount.text = String(player.shockGum)
        waterBalloonAmount.text = String(player.waterBalloon)
        matchAmount.text = String(player.matches)
        updateItemAmount()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func dietSodaOnPush(sender: AnyObject) {
        dietSodaHealthCheck()
        player.dietSoda = player.dietSoda - 1
        updateItemAmount()
    }
    
    @IBAction func sodaOnPush(sender: AnyObject) {
        player.health = player.healthMax
        player.soda = player.soda - 1
        updateItemAmount()
    }
    @IBAction func shockGumOnPush(sender: AnyObject) {
        usedMagic = true
        whatMagicType = 1
        player.matches = player.matches - 1
        updateItemAmount()

        
    }
    @IBAction func waterBalloonOnPush(sender: AnyObject) {
        usedMagic = true
        whatMagicType = 2
        player.waterBalloon = player.waterBalloon - 1
        updateItemAmount()
    }
    @IBAction func mathOnPush(sender: AnyObject) {
        usedMagic = true
        whatMagicType = 3
        player.waterBalloon = player.waterBalloon - 1
        updateItemAmount()
    }
    
    func updateItemAmount()
    {
        if player.dietSoda > 0
        {
            dietSodaButton.alpha = 1
            dietSodaAmount.text = String(player.dietSoda)
        }
        else
        {
            dietSodaButton.alpha = 0
            dietSodaAmount.text = String(player.dietSoda)

        }
        
        if player.soda > 0
        {
            sodaButton.alpha = 1
            sodaAmount.text = String(player.soda)
        }
        else
        {
            sodaButton.alpha = 0
            sodaAmount.text = String(player.soda)

        }
        
        if player.shockGum > 0
        {
            if inKombat == true
            {
                shockGumButton.alpha = 1
                shockGumAmount.text = String(player.shockGum)
            }
            else
            {
                shockGumButton.alpha = 0
                shockGumAmount.text = String(player.shockGum)
            }

        }
        else
        {
            shockGumButton.alpha = 0
            shockGumAmount.text = String(player.shockGum)
        }
        
        if player.waterBalloon > 0
        {
            if inKombat == true
            {

                waterBalloonButton.alpha = 1
                waterBalloonAmount.text = String(player.waterBalloon)
            }
            else
            {
                shockGumButton.alpha = 0
                shockGumAmount.text = String(player.shockGum)
            }

        }
        else
        {
            
            waterBalloonButton.alpha = 0
            waterBalloonAmount.text = String(player.waterBalloon)
        }
        
        if player.matches > 0
        {
            if inKombat == true
            {
                matchButton.alpha = 1
                matchAmount.text = String(player.matches)
            }
            else
            {
                shockGumButton.alpha = 0
                shockGumAmount.text = String(player.shockGum)
            }

        }
        else
        {
            matchButton.alpha = 0
            matchAmount.text = String(player.matches)

        }
    }
    
    func dietSodaHealthCheck()
    {
        player.health = player.health + player.healthMax/2
        if player.health > player.healthMax
        {
            player.health = player.healthMax
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! ViewController
        dvc.player = player
        dvc.enemy = enemy
        dvc.inKombat = inKombat
        dvc.whatLevel = whatLevel
        dvc.whatMagicType = whatMagicType
        dvc.usedMagic = usedMagic
        dvc.usedItem = usedMagic

    }

    }