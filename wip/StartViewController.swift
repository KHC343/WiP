//
//  StartViewController.swift
//  wip
//
//  Created by Kristian Carter on 3/15/16.
//  Copyright © 2016 LateNightGames. All rights reserved.
//

import UIKit
class StartViewController: UIViewController {
    
    var player = Player()
    var loadOrSave = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player(str: 1, dex: 1, magic: 1, def: 1, health: 10, level: 1, soda: 0, dietSoda: 1, shockGum: 0, waterBalloon: 0, matches: 0, healthMas: 10, name: "timmy", exp: 0, levelUp: 100, perkPoint: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func newGameButton(sender: AnyObject) {
        loadOrSave = 1

    }
    @IBAction func Load(sender: AnyObject) {
        loadOrSave = 2
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! ViewController
        dvc.player = player
        dvc.loadOrSave = loadOrSave
    }

}
