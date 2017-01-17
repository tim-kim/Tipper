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
    
    
    var tipPercentages = [0.18, 0.2, 0.25, 0.3]
    var people = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        billField.isHidden = true
        
        let defaults = UserDefaults.standard
        tipPercentages[3] = defaults.double(forKey: "custom")
        people = defaults.integer(forKey: "split")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        inputLabel.text = String(format: "$%.2f", bill)
        let tip = (bill * tipPercentages[tipControl.selectedSegmentIndex]) / Double(people)
        let total = bill + (tip * Double(people))
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "settings") {
            
        }
    }

}

