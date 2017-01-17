//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Tim Kim on 1/10/17.
//  Copyright © 2017 Tim Kim. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var setCustom: UITextField!
    @IBOutlet weak var splitTip: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(0.3, forKey: "custom")
        defaults.set(1, forKey: "split")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(_ sender: AnyObject) {
        let defaults: UserDefaults = UserDefaults.standard
        let customPercent = Double(setCustom.text!) ?? 0
        defaults.set(customPercent * 0.01, forKey: "custom")
        defaults.set(self.splitTip.text, forKey: "split")
        defaults.synchronize()
        navigationController?.popViewController(animated: true)
    }


}
