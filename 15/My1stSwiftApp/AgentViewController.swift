//
//  AgentViewController.swift
//  My1stSwiftApp
//
//  Created by don't touch me on 6/14/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class AgentViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var greetingLabel: UILabel!
   
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField == userTextField {
            passTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            
        }
        return true
        
    }
    

    @IBAction func authTapped(sender: UIButton) {

        if (self.userTextField?.text == "sanchez") && (self.passTextField?.text == "password") {
        
                self.view.backgroundColor = UIColor.greenColor()
                self.greetingLabel.text = "Good Evening, Jason"
        
        
        } else {
                self.view.backgroundColor = UIColor.redColor()
        }

    }
}
    



    

   

