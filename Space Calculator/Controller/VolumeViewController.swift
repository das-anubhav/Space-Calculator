//
//  LengthViewController.swift
//  Space Calculator
//
//  Created by ANUBHAV DAS on 20/06/20.
//  Copyright © 2020 Captain Anubhav. All rights reserved.
//

import UIKit

class VolumeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    
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
    
    var priorityTypes = ["L","m3","dm3","cm3","mm3","ft3","in3"]
    var priorityTypes2 = ["L","m3","dm3","cm3","mm3","ft3","in3"]
    
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
            case "L":
                if unit2 == "L"
                {
                    ans = Double(x!)
                }
                if unit2 == "m3"
                {
                    ans = Double(x! * 0.001)
                }
                if unit2 == "dm3"
                {
                    ans = Double(x!)
                }
                if unit2 == "cm3"
                {
                    ans = Double(x! * 1000)
                }
                if unit2 == "ft3"
                {
                    ans = Double(x! * 0.0353147)
                }
                if unit2 == "in3"
                {
                    ans = Double(x! * 61.0237)
                }
                if unit2 == "mm3"
                {
                    ans = Double(x! * 1000000)
                }
            case "m3":
                if unit2 == "L"
                {
                    ans = Double(x! * 1000)
                }
                if unit2 == "m3"
                {
                    ans = Double(x!)
                }
                if unit2 == "dm3"
                {
                    ans = Double(x! * 1000)
                }
                if unit2 == "cm3"
                {
                    ans = Double(x! * 1000000)
                }
                if unit2 == "ft3"
                {
                    ans = Double(x! * 35.3147)
                }
                if unit2 == "in3"
                {
                    ans = Double(x! * 61023.7)
                }
                if unit2 == "mm3"
                {
                    ans = Double(x! * 1e+9)
                }
            case "dm3":
                if unit2 == "L"
                {
                    ans = Double(x!)
                }
                if unit2 == "m3"
                {
                    ans = Double(x! * 0.001)
                }
                if unit2 == "dm3"
                {
                    ans = Double(x!)
                }
                if unit2 == "cm3"
                {
                    ans = Double(x! * 1000)
                }
                if unit2 == "ft3"
                {
                    ans = Double(x! * 0.0353147)
                }
                if unit2 == "in3"
                {
                    ans = Double(x! * 61.0237)
                }
                if unit2 == "mm3"
                {
                    ans = Double(x! * 1000000)
                }
            case "cm3":
                if unit2 == "L"
                {
                    ans = Double(x! * 0.001)
                }
                if unit2 == "m3"
                {
                    ans = Double(x! * 1e-6)
                }
                if unit2 == "dm3"
                {
                    ans = Double(x! * 0.001)
                }
                if unit2 == "cm3"
                {
                    ans = Double(x! * 1e+6)
                }
                if unit2 == "ft3"
                {
                    ans = Double(x! * 35.3147)
                }
                if unit2 == "in3"
                {
                    ans = Double(x! * 61023.801579099)
                }
                if unit2 == "mm3"
                {
                    ans = Double(x! * 1000)
                }
            case "ft3":
                if unit2 == "L"
                {
                    ans = Double(x! * 28.3168)
                }
                if unit2 == "m3"
                {
                    ans = Double(x! * 0.0283168)
                }
                if unit2 == "dm3"
                {
                    ans = Double(x! * 28.3168)
                }
                if unit2 == "cm3"
                {
                    ans = Double(x! * 28316.8)
                }
                if unit2 == "ft3"
                {
                    ans = Double(x!)
                }
                if unit2 == "in3"
                {
                    ans = Double(x! * 1728)
                }
                if unit2 == "mm3"
                {
                    ans = Double(x! * 2.832e+7)
                }
            case "in3":
                if unit2 == "L"
                {
                    ans = Double(x! * 0.0163871)
                }
                if unit2 == "m3"
                {
                    ans = Double(x! * 1.6387e-5)
                }
                if unit2 == "dm3"
                {
                    ans = Double(x! * 0.0163871)
                }
                if unit2 == "cm3"
                {
                    ans = Double(x! * 16.3871)
                }
                if unit2 == "ft3"
                {
                    ans = Double(x! * 0.000578704)
                }
                if unit2 == "in3"
                {
                    ans = Double(x!)
                }
                if unit2 == "mm3"
                {
                    ans = Double(x! * 16387.1)
                }
            case "mm3":
                if unit2 == "L"
                {
                    ans = Double(x! * 1e-6)
                }
                if unit2 == "m3"
                {
                    ans = Double(x! * 1e-9)
                }
                if unit2 == "dm3"
                {
                    ans = Double(x! * 1e-6)
                }
                if unit2 == "cm3"
                {
                    ans = Double(x! * 0.001)
                }
                if unit2 == "ft3"
                {
                    ans = Double(x! * 3.5315e-8)
                }
                if unit2 == "in3"
                {
                    ans = Double(x! * 6.1024e-5)
                }
                if unit2 == "mm3"
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
