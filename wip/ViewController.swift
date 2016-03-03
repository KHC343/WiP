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
    @IBOutlet weak var runButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var enemyNameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var healthAmount: UILabel!
    @IBOutlet weak var enemyHealthAmount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

