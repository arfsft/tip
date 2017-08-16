//
//  SettingViewController.swift
//  tipster
//
//  Created by Arif Orcun on 16/08/2017.
//  Copyright © 2017 Arif Orcun. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //load the current tip index from the local storage.
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "default_tip_index")
        tipControl.selectedSegmentIndex = defaultTipIndex
    }
    
    //when change setting, load it to NSUserDefaults as local storage.
    @IBAction func onChangeDefaultTip(_ sender: AnyObject) {
        let changedDefaultTip = tipControl.selectedSegmentIndex;
        let defaults = UserDefaults.standard
        defaults.set(changedDefaultTip, forKey: "default_tip_index")
        defaults.synchronize()
    }

    @IBAction func onClose(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}
