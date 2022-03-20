//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Juan Ramírez Blancas on 19/03/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var people: Int?
    var tipPerct: Int?
    var total: Double? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", total!)
        let settingsText = "Split between \(people ?? 0), with \(tipPerct ?? 0)% tip"
        settingsLabel.text = settingsText
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
