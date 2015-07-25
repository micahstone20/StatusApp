//
//  ViewController.swift
//  Status1.3
//
//  Created by Larus on 7/24/15.
//  Copyright (c) 2015 LarusStone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {
    
    // MARK: Properties
    
    @IBOutlet weak var statusSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var doingTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        doingTextField.delegate = self;
        statusSegmentControl.tintColor = UIColor.redColor();    // Start as busy
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Actions
    
    @IBAction func setStatus(sender: UISegmentedControl) {
        if statusSegmentControl.selectedSegmentIndex == 0 {
            statusSegmentControl.tintColor = UIColor.redColor();
        } else if statusSegmentControl.selectedSegmentIndex == 1 {
            statusSegmentControl.tintColor = UIColor.greenColor();
        } else {
            assert(true, "control has > 2 segments");
        }
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        doingTextField.text = textField.text
    }
}

