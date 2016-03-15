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
    var player = Player()

    override func viewDidLoad() {
        super.viewDidLoad()
        strAmount.text = String(player.str)
        dexAmount.text = String(player.dex)
        defAmount.text = String(player.def)
        magicAmount.text = String(player.magic)
        lvl.text = String(player.level)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
