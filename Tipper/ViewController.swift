//
//  ViewController.swift
//  Tipper
//
//  Created by Tim Kim on 1/5/17.
//  Copyright © 2017 Tim Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var inputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        billField.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25, 0.3]
        
        let bill = Double(billField.text!) ?? 0
        inputLabel.text = String(format: "$%.2f", bill)
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

