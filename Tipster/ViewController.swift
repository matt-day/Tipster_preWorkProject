//
//  ViewController.swift
//  Tipster
//
//  Created by Matt Day on 10/8/20.
//

import UIKit

class ViewController: UIViewController  {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    //Used to set default tip percentage
    var tipPercent = UserDefaults.standard.integer(forKey: "setTip")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tipster"
        
        // Enables the keyboard when the view loads.
        DispatchQueue.main.async {
            self.billAmountTextField.becomeFirstResponder()
        }
        
        // Will take into account the geographic region of the user to display different currency symbols.
        // Also used in the calculateTip function.
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        billAmountTextField.attributedPlaceholder = NSAttributedString(string: currencySymbol)
        tipPercentageLabel.attributedText = NSAttributedString(string: currencySymbol+"0.00")
        totalLabel.attributedText = NSAttributedString(string: currencySymbol+"0.00")
        
        //Should read the UserDefaults to set the tip percentage
        tipControl.selectedSegmentIndex = tipPercent
        
    }
    
    // Used to get default tip percentage
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tipPercent = UserDefaults.standard.integer(forKey: "setTip")
        tipControl.selectedSegmentIndex = tipPercent
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get initial bill amount and calculate tips.
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.1, 0.15, 0.2, 0.25]
        
        //Calulate tip and total.
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total lables.
        tipPercentageLabel.text = currencySymbol+String(format: "%.2f", tip)
        totalLabel.text = currencySymbol+String(format: "%.2f", total)
        
    }
}

