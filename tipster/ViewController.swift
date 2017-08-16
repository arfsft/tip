//
//  ViewController.swift
//  tipster
//
//  Created by Arif Orcun on 16/08/2017.
//  Copyright © 2017 Arif Orcun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "default_tip_index")
        tipControl.selectedSegmentIndex = defaultTipIndex
    }
    
    
    @IBAction func onEditingChanged(_ sender: AnyObject) {
        var tipPercentages = [0.18, 0.20, 0.22]
        let billAmount = (billField.text! as NSString).doubleValue
        let currTipIndex = tipControl.selectedSegmentIndex
        let currTipPercentage = tipPercentages[currTipIndex]
        let tip = billAmount * currTipPercentage
        let total = billAmount + tip
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
    }
 
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        //when tap anywhere on the screen, cancel the number pad triggered by input
        view.endEditing(true)
    }
   



}

