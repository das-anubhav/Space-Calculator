//
//  LengthViewController.swift
//  Space Calculator
//
//  Created by ANUBHAV DAS on 20/06/20.
//  Copyright © 2020 Captain Anubhav. All rights reserved.
//

import UIKit

class SpeedViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if textField.isEditing {
            return priorityTypes.count
        }
        if textField2.isEditing {
            return priorityTypes2.count
        }
        else
        {
            return 0
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if textField.isEditing {
            return priorityTypes[row]
        }
        if textField2.isEditing {
            return priorityTypes2[row]
        }
        else
        {
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        if textField.isEditing {
            selectedPriority = priorityTypes[row]
            
            textField.text = selectedPriority
        }
        if textField2.isEditing {
            selectedPriority2 = priorityTypes2[row]
            
            textField2.text = selectedPriority2
        }
        
        
    }
    
    
    
    
    
    var selectedPriority: String?
    var selectedPriority2: String?
    
    var priorityTypes = ["m/s","mph","km/h","fps"]
    var priorityTypes2 = ["m/s","mph","km/h","fps"]
    
    func createPickerView()
    {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        if textField.isUserInteractionEnabled == true {
            textField.inputView = pickerView
        }
        
        if textField2.isUserInteractionEnabled  {
            textField2.inputView = pickerView
        }
        
    }
    
    func dismissPickerView()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        if textField.isUserInteractionEnabled
        {
            textField.inputAccessoryView = toolBar
        }
        if textField2.isUserInteractionEnabled
        {
            textField2.inputAccessoryView = toolBar
        }
        
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
 
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        createPickerView()
        dismissPickerView()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    self.view.endEditing(true)
    
    }
    
    
          
    @IBOutlet var textNum1: UITextField!
    @IBOutlet var result: UITextField!
    
    @IBAction func calculate(_ sender: UIButton) {
        let x = Double(textNum1.text!)
        let unit1 = textField.text
        let unit2 = textField2.text
        var ans = 2.00000
        
        if x == 0 {
            ans = 0
        }
        else {
        switch unit1 {
        case "m/s":
            if unit2 == "m/s"
            {
                ans = Double(x!)
            }
            if unit2 == "mph"
            {
                ans = Double(x! * 2.23694)
            }
            if unit2 == "km/h"
            {
                ans = Double(x! * 3.6)
            }
            if unit2 == "fps"
            {
                ans = Double(x! * 3.28084)
            }
            case "mph":
            if unit2 == "m/s"
            {
                ans = Double(x! * 0.44704)
            }
            if unit2 == "mph"
            {
                ans = Double(x!)
            }
            if unit2 == "km/h"
            {
                ans = Double(x! * 1.60934)
            }
            if unit2 == "fps"
            {
                ans = Double(x! * 1.46667)
            }
            case "km/h":
            if unit2 == "m/s"
            {
                ans = Double(x! * 0.277778)
            }
            if unit2 == "mph"
            {
                ans = Double(x! * 0.621371)
            }
            if unit2 == "km/h"
            {
                ans = Double(x!)
            }
            if unit2 == "fps"
            {
                ans = Double(x! * 0.911344)
            }
            case "fps":
            if unit2 == "m/s"
            {
                ans = Double(x! * 0.3048)
            }
            if unit2 == "mph"
            {
                ans = Double(x! * 0.681818)
            }
            if unit2 == "km/h"
            {
                ans = Double(x! * 1.09728)
            }
            if unit2 == "fps"
            {
                ans = Double(x!)
            }
        default:
            ans = Double(x!)
        }
        
        }
        
        result.text = "\(ans)"
        
        
    }

    

    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
}
