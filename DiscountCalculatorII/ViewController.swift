//
//  ViewController.swift
//  DiscountCalculatorII
//
//  Created by SwiftiCode on 21/6/20.
//  Copyright © 2020 SwiftiCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var discountTextField: UITextField!
    @IBOutlet weak var discountSegmentControl: UISegmentedControl!
    @IBOutlet weak var discountAmtLabel: UILabel!
    @IBOutlet weak var discountTotal: UILabel!
    
    var inputAmount = 0.0
    
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        discountTextField.delegate = self
        
    }

    // MARK: UITextFieldDelega
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        inputAmount = Double(textField.text!) ?? 0.0
        calculateDiscount(discountSegmentControl)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    // MARK: IBAction
    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        
        discountTextField.resignFirstResponder()
    }
    
    @IBAction func calculateDiscount(_ sender: UISegmentedControl) {
        
        var percentage: Double
        
        discountTextField.resignFirstResponder()
        
        let rateIndex = discountSegmentControl.selectedSegmentIndex
        
        switch rateIndex {
        case 0: percentage = 0.05
        case 1: percentage = 0.10
        case 2: percentage = 0.15
        case 3: percentage = 0.20
        case 4: percentage = 0.25
        case 5: percentage = 0.30
        case 6: percentage = 0.35
        default: percentage = 0.00
        }
        
        let discountAmt = inputAmount * percentage
        let total = inputAmount - discountAmt
        
        discountAmtLabel.text = String(format: "Discount Amount = $%.2f", discountAmt)
        discountTotal.text = String(format: "After Discount = $%.2f", total)
        
        
    }
    
    
}

