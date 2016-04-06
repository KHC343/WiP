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
        player.health = player.healthMax
    }
    
    @IBAction func sodaOnPush(sender: AnyObject) {
        player.health = player.healthMax/2
        
    }
    @IBAction func shockGumOnPush(sender: AnyObject) {
        
    }
    @IBAction func waterBalloonOnPush(sender: AnyObject) {
        
    }
    @IBAction func mathOnPush(sender: AnyObject) {
        
    }
    
    func updateItemAmount()
    {
        if player.dietSoda > 0
        {
            dietSodaButton.alpha = 1
        }
        else
        {
            dietSodaButton.alpha = 0
        }
        
        if player.soda > 0
        {
            sodaButton.alpha = 1
        }
        else
        {
            sodaButton.alpha = 0
        }
        
        if player.shockGum > 0
        {
            shockGumButton.alpha = 1
        }
        else
        {
            shockGumButton.alpha = 0
        }
        
        if player.waterBalloon > 0
        {
            waterBalloonButton.alpha = 1
        }
        else
        {
            waterBalloonButton.alpha = 0
        }
        
        if player.matches > 0
        {
            matchButton.alpha = 1
        }
        else
        {
            matchButton.alpha = 0
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! ViewController
        dvc.player = player
        dvc.inKombat = inKombat
    }

    }