//
//  ViewController.swift
//  Dicee
//
//  Created by Jay RAmirez on 11/03/2022.
//

import UIKit

class ViewController: UIViewController {

    let dicesArray = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    @IBOutlet weak var diceTwoImageView: UIImageView!
    @IBOutlet weak var diceOneImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceOneImageView.image = UIImage(named: "DiceOne")
        diceTwoImageView.image = UIImage(named: "DiceSix")
    }
    
    @IBAction func rollDice(_ sender: UIButton) {
        let diceOneRoll = Int.random(in: 0...5)
        let diceTwoRoll = Int.random(in: 0...5)
        diceOneImageView.image = UIImage(named: dicesArray[diceOneRoll])
        diceTwoImageView.image = UIImage(named: dicesArray[diceTwoRoll])
        
    }
    

}

