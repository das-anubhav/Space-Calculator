//
//  SecondViewController.swift
//  ALL in 1 CALCULATOR
//
//  Created by ANUBHAV DAS on 08/06/20.
//  Copyright © 2020 Captain Anubhav. All rights reserved.
//

import UIKit

class BMIViewController: UIViewController {

    var BmiBrain = CalculateBmiBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        let height = String(format: "%0.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        let weight = String(format: "%0.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        BmiBrain.calculateBmi(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! BMIResultViewController
            destinationVC.bmiValue = BmiBrain.getBmiValue()
            destinationVC.advice = BmiBrain.getAdvice()
            destinationVC.img = BmiBrain.getImage()
        }
    }
    
}

