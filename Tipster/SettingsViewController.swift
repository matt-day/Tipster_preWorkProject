//
//  SettingsViewController.swift
//  Tipster
//
//  Created by Matt Day on 10/8/20.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentageDefault: UISegmentedControl!
    
    let tipPercent = UserDefaults.standard.integer(forKey: "setTip")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"

        tipPercentageDefault.selectedSegmentIndex = tipPercent
    }
    
    //Used to set the default tip percentage
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tipPercentageDefault.selectedSegmentIndex = tipPercent
    }
    
    //Used to set the default tip percentage
    @IBAction func defaultTipChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tipPercentageDefault.selectedSegmentIndex, forKey: "setTip")
        defaults.synchronize()
    }
}
