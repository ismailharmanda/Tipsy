//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

 
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var currentPercentage:String?="10%"
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        currentPercentage=sender.currentTitle!
        makeSelected(buttonText: currentPercentage!)
    }
    @IBAction func stepValueChanged(_ sender: UIStepper) {
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let percentage = Double(currentPercentage!.dropLast()) // "50" after dropping "%"
        let numericValue = percentage! / 100.0 // Convert to decimal (0.50)
        let result = Double(Int(splitNumberLabel.text!)!) * numericValue
        print(result)
    }
    
    func makeSelected(buttonText:String){
        if (buttonText=="0%"){
            zeroPctButton.isSelected=true
            tenPctButton.isSelected=false
            twentyPctButton.isSelected=false
        } else if(buttonText=="10%"){
            zeroPctButton.isSelected=false
            tenPctButton.isSelected=true
            twentyPctButton.isSelected=false
        } else if(buttonText=="20%"){
            zeroPctButton.isSelected=false
            tenPctButton.isSelected=false
            twentyPctButton.isSelected=true
        }
    }
}

