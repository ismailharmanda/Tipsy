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
    var result:String?
    var people:Double?
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        currentPercentage=sender.currentTitle!
        makeSelected(buttonText: currentPercentage!)
        billTextField.endEditing(true)
    }
    @IBAction func stepValueChanged(_ sender: UIStepper) {
        people=sender.value
        splitNumberLabel.text=String(format: "%.0f", people!)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let percentage = Double(currentPercentage!.dropLast()) // "50" after dropping "%"
        let numericValue = percentage! / 100.0 // Convert to decimal (0.50)
        result = String(format:"%.2f",(Double(billTextField.text!)! * numericValue+Double(billTextField.text!)!)/Double(splitNumberLabel.text!)!)
        self.performSegue(withIdentifier: "goToResult",sender:self)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="goToResult"{
            let destinationVC=segue.destination as! ResultsViewController
            destinationVC.total = result
    destinationVC.settings = "Split between \(String(format: "%.0f", people!)) people, with \(currentPercentage!) tip."
        }
    }

}

