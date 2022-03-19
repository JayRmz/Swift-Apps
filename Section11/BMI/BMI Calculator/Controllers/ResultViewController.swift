//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Juan Ramírez Blancas on 16/03/22.
//

import UIKit

class ResultViewController: UIViewController {
    var bmiValue: String?
    var advice: String?
    var color: UIColor?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backgroundColor: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue ?? "Hi!"
        adviceLabel.text = advice ?? "No advice"
        view.backgroundColor = color ?? UIColor.gray
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
