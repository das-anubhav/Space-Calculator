//
//  LengthViewController.swift
//  Space Calculator
//
//  Created by ANUBHAV DAS on 20/06/20.
//  Copyright © 2020 Captain Anubhav. All rights reserved.
//

import UIKit

class AreaViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    
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
    
    var priorityTypes = ["Km2","m2","dm2","cm2","mm2","ft2","in2"]
    var priorityTypes2 = ["Km2","m2","dm2","cm2","mm2","ft2","in2"]
    
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
        case "Km2":
            if unit2 == "Km2"
            {
                ans = Double(x!)
            }
            if unit2 == "m2"
            {
                ans = Double(x! * 1e+6)
            }
            if unit2 == "dm2"
            {
                ans = Double(x! * 1e+8)
            }
            if unit2 == "cm2"
            {
                ans = Double(x! * 1e+10)
            }
            if unit2 == "ft2"
            {
                ans = Double(x! * 1.076e+7)
            }
            if unit2 == "in2"
            {
                ans = Double(x! * 1.55e+9)
            }
            if unit2 == "mm2"
            {
                ans = Double(x! * 1e+12)
            }
        case "m2":
            if unit2 == "Km2"
            {
                ans = Double(x! * 1e-6)
            }
            if unit2 == "m2"
            {
                ans = Double(x!)
            }
            if unit2 == "dm2"
            {
                ans = Double(x! * 100)
            }
            if unit2 == "cm2"
            {
                ans = Double(x! * 100 * 100)
            }
            if unit2 == "ft2"
            {
                ans = Double(x! * 10.7639)
            }
            if unit2 == "in2"
            {
                ans = Double(x! * 1550)
            }
            if unit2 == "mm2"
            {
                ans = Double(x! * 1000000)
            }
        case "dm2":
            if unit2 == "Km2"
            {
                ans = Double(x! * 1e-8)
            }
            if unit2 == "m2"
            {
                ans = Double(x! / 10 / 10)
            }
            if unit2 == "dm2"
            {
                ans = Double(x!)
            }
            if unit2 == "cm2"
            {
                ans = Double(x! * 10 * 10)
            }
            if unit2 == "ft2"
            {
                ans = Double(x! * 0.107639)
            }
            if unit2 == "in2"
            {
                ans = Double(x! * 15.5)
            }
            if unit2 == "mm2"
            {
                ans = Double(x! * 10000)
            }
        case "cm2":
           if unit2 == "Km2"
            {
                ans = Double(x! * 1e-10)
            }
            if unit2 == "m2"
            {
                ans = Double(x! * 1e-4)
            }
            if unit2 == "dm2"
            {
                ans = Double(x! * 0.01)
            }
            if unit2 == "cm"
            {
                ans = Double(x!)
            }
            if unit2 == "ft"
            {
                ans = Double(x! * 0.00107639)
            }
            if unit2 == "in"
            {
                ans = Double(x! * 0.155)
            }
            if unit2 == "mm"
            {
                ans = Double(x! * 10000)
            }
        case "ft":
            if unit2 == "Km"
            {
                ans = Double(x! * 9.2903e-8)
            }
            if unit2 == "m"
            {
                ans = Double(x! * 0.092903)
            }
            if unit2 == "dm"
            {
                ans = Double(x! * 9.2903)
            }
            if unit2 == "cm"
            {
                ans = Double(x! * 929.03)
            }
            if unit2 == "ft"
            {
                ans = Double(x! * 1)
            }
            if unit2 == "in"
            {
                ans = Double(x! * 144)
            }
            if unit2 == "mm"
            {
                ans = Double(x! * 92903)
            }
        case "in":
            if unit2 == "Km"
            {
                ans = Double(x! * 6.4516e-10)
            }
            if unit2 == "m"
            {
                ans = Double(x! * 0.00064516)
            }
            if unit2 == "dm"
            {
                ans = Double(x! * 0.064516)
            }
            if unit2 == "cm"
            {
                ans = Double(x! * 6.4516)
            }
            if unit2 == "ft"
            {
                ans = Double(x! * 0.00694444)
            }
            if unit2 == "in"
            {
                ans = Double(x! * 1)
            }
            if unit2 == "mm"
            {
                ans = Double(x! * 645.16)
            }
        case "mm":
            if unit2 == "Km"
            {
                ans = Double(x! * 1e-12)
            }
            if unit2 == "m"
            {
                ans = Double(x! * 1e-6)
            }
            if unit2 == "dm"
            {
                ans = Double(x! * 1e-4)
            }
            if unit2 == "cm"
            {
                ans = Double(x! * 0.01)
            }
            if unit2 == "ft"
            {
                ans = Double(x! * 1.0764e-5)
            }
            if unit2 == "in"
            {
                ans = Double(x! * 0.00155)
            }
            if unit2 == "mm"
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
