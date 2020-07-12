//
//  LengthViewController.swift
//  Space Calculator
//
//  Created by ANUBHAV DAS on 20/06/20.
//  Copyright © 2020 Captain Anubhav. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    
    
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
    
    var priorityTypes = ["Day","h","min","ms","s","Year","Week"]
    var priorityTypes2 = ["Day","h","min","ms","s","Year","Week"]
    
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
            ans = x!
        }
        else {
            switch unit1 {
            case "Day":
                if unit2 == "Day"
                {
                    ans = Double(x!)
                }
                if unit2 == "h"
                {
                    ans = Double(x! * 24)
                }
                if unit2 == "min"
                {
                    ans = Double(x! * 1440)
                }
                if unit2 == "s"
                {
                    ans = Double(x! * 86400)
                }
                if unit2 == "ms"
                {
                    ans = Double(x! * 8.64e+7)
                }
                if unit2 == "Year"
                {
                    ans = Double(x! * 0.00273973)
                }
                if unit2 == "Week"
                {
                    ans = Double(x! * 0.142857)
                }
            case "h":
                if unit2 == "Day"
                {
                    ans = Double(x! * 0.0416667)
                }
                if unit2 == "h"
                {
                    ans = Double(x! * 1)
                }
                if unit2 == "min"
                {
                    ans = Double(x! * 60)
                }
                if unit2 == "s"
                {
                    ans = Double(x! * 3600)
                }
                if unit2 == "ms"
                {
                    ans = Double(x! * 3.6e+6)
                }
                if unit2 == "Year"
                {
                    ans = Double(x! * 0.000114155)
                }
                if unit2 == "Week"
                {
                    ans = Double(x! * 0.00595238)
                }
            case "min":
                if unit2 == "Day"
                {
                    ans = Double(x! * 0.000694444)
                }
                if unit2 == "h"
                {
                    ans = Double(x! * 0.0166667)
                }
                if unit2 == "min"
                {
                    ans = Double(x! * 1)
                }
                if unit2 == "s"
                {
                    ans = Double(x! * 60)
                }
                if unit2 == "ms"
                {
                    ans = Double(x! * 60000)
                }
                if unit2 == "Year"
                {
                    ans = Double(x! * 1.9026e-6)
                }
                if unit2 == "Week"
                {
                    ans = Double(x! * 9.9206e-5)
                }
            case "s":
                if unit2 == "Day"
                {
                    ans = Double(x! * 1.1574e-5)
                }
                if unit2 == "h"
                {
                    ans = Double(x! * 0.000277778)
                }
                if unit2 == "min"
                {
                    ans = Double(x! * 0.0166667)
                }
                if unit2 == "s"
                {
                    ans = Double(x! * 1)
                }
                if unit2 == "ms"
                {
                    ans = Double(x! * 1000)
                }
                if unit2 == "Year"
                {
                    ans = Double(x! * 3.171e-8)
                }
                if unit2 == "Week"
                {
                    ans = Double(x! * 1.6534e-6)
                }
            case "ms":
                if unit2 == "Day"
                {
                    ans = Double(x! * 1.1574e-8)
                }
                if unit2 == "h"
                {
                    ans = Double(x! * 2.7778e-7)
                }
                if unit2 == "min"
                {
                    ans = Double(x! * 1.6667e-5)
                }
                if unit2 == "s"
                {
                    ans = Double(x! * 0.001)
                }
                if unit2 == "ms"
                {
                    ans = Double(x! * 1)
                }
                if unit2 == "Year"
                {
                    ans = Double(x! * 3.171e-11)
                }
                if unit2 == "Week"
                {
                    ans = Double(x! * 1.6534e-9)
                }
            case "Year":
                if unit2 == "Day"
                {
                    ans = Double(x! * 365)
                }
                if unit2 == "h"
                {
                    ans = Double(x! * 8760)
                }
                if unit2 == "min"
                {
                    ans = Double(x! * 525600)
                }
                if unit2 == "s"
                {
                    ans = Double(x! * 3.154e+7)
                }
                if unit2 == "ms"
                {
                    ans = Double(x! * 3.154e+10)
                }
                if unit2 == "Year"
                {
                    ans = Double(x! * 1)
                }
                if unit2 == "Week"
                {
                    ans = Double(x! * 52.1429)
                }
            case "Week":
                if unit2 == "Day"
                {
                    ans = Double(x! * 7)
                }
                if unit2 == "h"
                {
                    ans = Double(x! * 168)
                }
                if unit2 == "min"
                {
                    ans = Double(x! * 10080)
                }
                if unit2 == "s"
                {
                    ans = Double(x! * 604800)
                }
                if unit2 == "ms"
                {
                    ans = Double(x! * 6.048e+8)
                }
                if unit2 == "Year"
                {
                    ans = Double(x! * 0.0191781)
                }
                if unit2 == "Week"
                {
                    ans = Double(x! * 1)
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
