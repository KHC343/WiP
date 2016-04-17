//
//  StatsViewController.swift
//  wip
//
//  Created by Kristian Carter on 3/3/16.
//  Copyright © 2016 LateNightGames. All rights reserved.
//

import UIKit

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
    @IBOutlet weak var amountOfExp: UILabel!
    var player = Player()
    var inKombat = Bool()
    var enemy = Enemy()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        strAmount.text = String(player.str)
        dexAmount.text = String(player.dex)
        defAmount.text = String(player.def)
        magicAmount.text = String(player.magic)
        lvl.text = String(player.level)
        strButton.alpha = 0
        dexButton.alpha = 0
        defButton.alpha = 0
        magicButton.alpha = 0
        amountOfExp.text = String(player.exp)
        characterHealthLabel.text = String(player.health)
        if player.perkPoint > 0
        {
            lvlUp()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! ViewController
        dvc.player = player
        dvc.enemy = enemy
        dvc.inKombat = inKombat
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
        strButton.alpha = 0
        dexButton.alpha = 0
        defButton.alpha = 0
        magicButton.alpha = 0
    }
    @IBAction func dexIncreaseButton(sender: AnyObject) {
        player.dex += 1
        strButton.alpha = 0
        dexButton.alpha = 0
        defButton.alpha = 0
        magicButton.alpha = 0
    }
    @IBAction func defIncreaseButton(sender: AnyObject) {
        player.def += 1
        strButton.alpha = 0
        dexButton.alpha = 0
        defButton.alpha = 0
        magicButton.alpha = 0
    }

}
