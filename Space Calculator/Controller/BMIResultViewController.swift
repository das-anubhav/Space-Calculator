//
//  BMIResultViewController.swift
//  Space Calculator
//
//  Created by ANUBHAV DAS on 12/06/20.
//  Copyright © 2020 Captain Anubhav. All rights reserved.
//

import UIKit

class BMIResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var img: UIImage?
    
   
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var adviceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageV.image = img
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
