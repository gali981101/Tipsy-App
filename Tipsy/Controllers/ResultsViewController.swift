//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Terry Jason on 2023/9/18.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var calculatedResult: Float?
    var numberOfPeople: Int?
    var tipPercentage: Float?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", calculatedResult!)
        settingLabel.text = "Split between \(String(describing: numberOfPeople!)) people, with \(Int(tipPercentage!*100))% tip."
    }
   
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
