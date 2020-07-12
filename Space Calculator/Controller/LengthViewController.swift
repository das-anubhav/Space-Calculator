//
//  LengthViewController.swift
//  Space Calculator
//
//  Created by ANUBHAV DAS on 20/06/20.
//  Copyright © 2020 Captain Anubhav. All rights reserved.
//

import UIKit

class LengthViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    
    
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
    
    var priorityTypes = ["Km","m","dm","cm","mm","ft","in"]
    var priorityTypes2 = ["Km","m","dm","cm","mm","ft","in"]
    
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
    
    @IBOutlet var textField: UITextField!
        
    @IBOutlet var textField2: UITextField!
    
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
        case "Km":
            if unit2 == "Km"
            {
                ans = Double(x!)
            }
            if unit2 == "m"
            {
                ans = Double(x! * 1000)
            }
            if unit2 == "dm"
            {
                ans = Double(x! * 10000)
            }
            if unit2 == "cm"
            {
                ans = Double(x! * 100000)
            }
            if unit2 == "ft"
            {
                ans = Double(x! * 3280.84)
            }
            if unit2 == "in"
            {
                ans = Double(x! * 39370.1)
            }
            if unit2 == "mm"
            {
                ans = Double(x! * 1000000)
            }
        case "m":
            if unit2 == "Km"
            {
                ans = Double(x! / 100)
            }
            if unit2 == "m"
            {
                ans = Double(x!)
            }
            if unit2 == "dm"
            {
                ans = Double(x! * 10)
            }
            if unit2 == "cm"
            {
                ans = Double(x! * 100)
            }
            if unit2 == "ft"
            {
                ans = Double(x! * 3.28084)
            }
            if unit2 == "in"
            {
                ans = Double(x! * 39.3701)
            }
            if unit2 == "mm"
            {
                ans = Double(x! * 1000)
            }
        case "dm":
            if unit2 == "Km"
            {
                ans = Double(x! / 10000)
            }
            if unit2 == "m"
            {
                ans = Double(x! / 10)
            }
            if unit2 == "dm"
            {
                ans = Double(x!)
            }
            if unit2 == "cm"
            {
                ans = Double(x! * 10)
            }
            if unit2 == "ft"
            {
                ans = Double(x! * 0.328084)
            }
            if unit2 == "in"
            {
                ans = Double(x! * 3.93701)
            }
            if unit2 == "mm"
            {
                ans = Double(x! * 100)
            }
        case "cm":
           if unit2 == "Km"
            {
                ans = Double(x! / 100000)
            }
            if unit2 == "m"
            {
                ans = Double(x! / 100)
            }
            if unit2 == "dm"
            {
                ans = Double(x! / 10)
            }
            if unit2 == "cm"
            {
                ans = Double(x!)
            }
            if unit2 == "ft"
            {
                ans = Double(x! * 0.0328084)
            }
            if unit2 == "in"
            {
                ans = Double(x! * 0.393701)
            }
            if unit2 == "mm"
            {
                ans = Double(x! * 10)
            }
        case "ft":
            if unit2 == "Km"
            {
                ans = Double(x! * 0.0003048)
            }
            if unit2 == "m"
            {
                ans = Double(x! * 0.3048)
            }
            if unit2 == "dm"
            {
                ans = Double(x! * 3.048)
            }
            if unit2 == "cm"
            {
                ans = Double(x! * 30.48)
            }
            if unit2 == "ft"
            {
                ans = Double(x! * 1)
            }
            if unit2 == "in"
            {
                ans = Double(x! * 12)
            }
            if unit2 == "mm"
            {
                ans = Double(x! * 304.8)
            }
        case "in":
            if unit2 == "Km"
            {
                ans = Double(x! * 2.54 / 100000)
            }
            if unit2 == "m"
            {
                ans = Double(x! * 0.0254)
            }
            if unit2 == "dm"
            {
                ans = Double(x! * 0.254)
            }
            if unit2 == "cm"
            {
                ans = Double(x! * 2.54)
            }
            if unit2 == "ft"
            {
                ans = Double(x! * 0.833333)
            }
            if unit2 == "in"
            {
                ans = Double(x! * 1)
            }
            if unit2 == "mm"
            {
                ans = Double(x! * 25.4)
            }
        case "mm":
            if unit2 == "Km"
            {
                ans = Double(x! / 1000000)
            }
            if unit2 == "m"
            {
                ans = Double(x! * 0.001)
            }
            if unit2 == "dm"
            {
                ans = Double(x! * 0.01)
            }
            if unit2 == "cm"
            {
                ans = Double(x! * 0.1)
            }
            if unit2 == "ft"
            {
                ans = Double(x! * 0.00328084)
            }
            if unit2 == "in"
            {
                ans = Double(x! * 0.0393701)
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
