//
//  BMIBrainViewController.swift
//  Space Calculator
//
//  Created by ANUBHAV DAS on 12/06/20.
//  Copyright © 2020 Captain Anubhav. All rights reserved.
//

import UIKit

struct CalculateBmiBrain {
    
    var bmi: BMI?
    
    func getBmiValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%BMI: %.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getImage() -> UIImage {
        return bmi?.img ?? UIImage(named: "Assets.xcassets/space-6.imageset")!
    }
    
    mutating func calculateBmi(height:Float, weight: Float) {
        let bmiValue = weight / (height * height)
        let l1 = (18.5 * height * height)
        let ex1 = l1 - weight
        let l2 = (24.9 * height * height)
        let ex2 = weight - l2
        print(height)
        print(weight)
        print(l2)
        print(ex2)
        
        if bmiValue < 18.5 {
            
            bmi = BMI(value: bmiValue, advice: "You need to eat some more, You need to gain \(round(ex1))Kg", img: #imageLiteral(resourceName: "space-1"))
        } else if bmiValue < 24.9 {
            
            bmi = BMI(value: bmiValue, advice: "You are FIT ", img: #imageLiteral(resourceName: "space-1"))
        } else {
           
            bmi = BMI(value: bmiValue, advice: "Have a Balanced Diet, You need to reduce \(round(ex2))Kg", img: #imageLiteral(resourceName: "space-1"))
        }
    }
}
