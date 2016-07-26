//
//  OuttaTimeViewController.swift
//  OuttaTime2
//
//  Created by don't touch me on 7/25/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit



class OuttaTimeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeLabel: UILabel!
   
    @IBOutlet weak var currentSpeedLabel: UILabel!
    
    let formattedDate = NSDateFormatter()
    var timer: NSTimer?
    var speed: Double = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        formattedDate.dateFormat = "MMM d, yyyy"
        let today : NSDate = NSDate()
        self.currentSpeedLabel.text = "0"
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
        speed = speed + 1
        if speed == 88 {
            timer?.invalidate()
            
            self.performSegueWithIdentifier("TimeSegue", sender: self)
            
        }
        self.currentSpeedLabel.text = "\(speed)"
        
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
       reset()
    }

    @IBAction func travelBackButton(sender: UIButton) {
        
        self.lastTimeLabel.text = self.presentTimeLabel.text
        self.speed = 0
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: #selector (OuttaTimeViewController.updateMiles), userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    func reset() {
        self.lastTimeLabel.text = "--- -- ---"
        self.presentTimeLabel.text = ""
        speed = 0
        self.currentSpeedLabel.text = "0 MPH"
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        dateEnter()
        self.timeTextField.resignFirstResponder()
        return true
    }


    
        
        
}
