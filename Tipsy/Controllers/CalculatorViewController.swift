//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tip: Float = 0.1
    var split = 2
    var result: Float?
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
   
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        switch sender.currentTitle! {
        case "0%":
            tip = 0.0
            
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case "10%":
            tip = 0.1
            
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
        default:
            tip = 0.2
            
            twentyPctButton.isSelected = true
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        split = Int(sender.value)
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculaterPressed(_ sender: UIButton) {
        calculating()
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    private func calculating() {
        result = (Float(billTextField.text!) ?? 0.0)*Float(1.0+tip)/Float(split)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.calculatedResult = result
            destinationVC.tipPercentage = tip
            destinationVC.numberOfPeople = split
        }
    }
    
}

