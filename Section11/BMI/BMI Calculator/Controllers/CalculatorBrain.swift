//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Juan Ramírez Blancas on 19/03/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit


struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        var advicetext = ""
        var color: UIColor
        
        if bmiValue < 18.5 {
            advicetext = "Eat more Pies!"
            color = UIColor.blue
        } else if bmiValue < 24.9 {
            advicetext = "Keep on"
            color = UIColor.green
        } else {
            advicetext = "Eat more apples"
            color = UIColor.red
        }
        bmi = BMI(value: bmiValue, advice: advicetext, color: color)
    }
    
    func getBMIValue() -> String{
        let bmiTo1DecPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.gray
    }
}
