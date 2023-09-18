//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by 김건우 on 2023/09/18.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    private var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2.0)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.systemYellow)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.systemBlue)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor.systemRed)
        }
    }
    
}
