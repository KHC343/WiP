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
    var player = Player()
    var inKombat = Bool()


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
        characterHealthLabel.text = String(player.health)
        print(player.name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! ViewController
        dvc.player = player
    }

}
