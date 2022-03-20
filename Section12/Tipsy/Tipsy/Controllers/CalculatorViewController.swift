//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipAmount = 0.0
    var numPeople = 2
    var billTotal = 0.0
    var total = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        if sender.tag == 0 {
            zeroPctButton.isSelected = true
            tipAmount = 0.0
        }
        
        if sender.tag == 1 {
            tenPctButton.isSelected = true
            tipAmount = 0.1
        }
        
        if sender.tag == 2 {
            twentyPctButton.isSelected = true
            tipAmount = 0.2
        }
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(Int(sender.value))
        numPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        billTotal = Double(billTextField.text!) ?? 0.0
        
        total = (billTotal + (billTotal * tipAmount)) / Double(numPeople)
        print(String(format: "%.2f", total))
        
        self.performSegue(withIdentifier: "showResults", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.people = numPeople
            destinationVC.tipPerct = Int(tipAmount * 100)
            destinationVC.total = total
        }
    }
}

