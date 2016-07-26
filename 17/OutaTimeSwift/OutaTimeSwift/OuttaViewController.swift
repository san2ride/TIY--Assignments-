//
//  OuttaViewController.swift
//  OutaTimeSwift
//
//  Created by don't touch me on 6/14/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class OuttaViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    @IBOutlet weak var timeTextField: UITextField!
    
    
    let formattedDate = NSDateFormatter()
    var milesPerHour = 0
    var timer:NSTimer?
    var currentSpeed:Double = 0.0
    var speedometer: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formattedDate.dateFormat = "MMM d, yyyy"
        let today : NSDate = NSDate()
        self.presentTimeLabel.text = formattedDate.stringFromDate(today)
        
    }
    
    func dateEnter() {
    
        formattedDate.dateFormat = "MMM d, yyyy"
        if let dateEnter = self.timeTextField.text {
            
            if let theDate = formattedDate.dateFromString(dateEnter) {
                formattedDate.dateFormat = "MMM d, yyyy"
                self.timeTextField.text = self.formattedDate.stringFromDate(theDate)
            }
    
        }
    
    }
    
    func updateMiles() {
        self.milesPerHour += 1
        if milesPerHour == 88 {
            self.timer?.invalidate()
            self.performSegueWithIdentifier("timeSegue", sender: self)
            
        }
//        self.currentSpeed.text = "\(milesPerHour) MPH"
        
    }
   
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        
       return
        
    }
    
    @IBAction func travelBack(sender: UIButton) {
//        self.performSegueWithIdentifier("timeSegue", sender: nil)
        
        self.lastTimeDepartedLabel.text = self.timeTextField.text
        self.milesPerHour = 0
        let speed = 0.1
        
    }
    
    func reset() {
        self.timeTextField.text = "--- -- ----"
//        self.currentSpeed.text = "\(milesPerHour) MPH"
        milesPerHour = 0
        let speedometer = "0 MPH"
        
    }
   
        func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        
        self.timeTextField.resignFirstResponder()
        
        return true
    }
    
}






    