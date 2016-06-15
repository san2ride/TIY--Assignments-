//
//  OuttaViewController.swift
//  OutaTimeSwift
//
//  Created by don't touch me on 6/14/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class OuttaViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var timeText: UITextField!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    @IBOutlet weak var lastTimeLabel: UILabel!
    
    @IBOutlet weak var currentSpeed: UILabel!
    
    
    let formattedDate = NSDateFormatter()
    var milesPerHour = 0
    var timer:NSTimer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        formattedDate.dateFormat = "MMM d, yyyy"
        let today : NSDate = NSDate()
        self.presentTimeLabel.text = formattedDate.stringFromDate(today)
        
    }
        
    func enteredDate()
    {
        formattedDate.dateFormat = "MMM d, yyyy"
        if let dateEnter = self.timeText.text {
            
        if let theDate = formattedDate.dateFromString(dateEnter) {
                formattedDate.dateFormat = "MMM d, yyyy"
                self.timeText.text = self.formattedDate.stringFromDate(theDate)
           }
        }
    }
    
    func updateMiles() {
        self.milesPerHour += 1
        if milesPerHour == 88 {
            self.timer?.invalidate()
            self.performSegueWithIdentifier("timeSegue", sender: self)
            
    }
        self.currentSpeed.text = "\(milesPerHour) MPH"
    
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        reset
        
    }

    @IBAction func travelBack(sender: UIButton) {
        self.performSegueWithIdentifier("timeSegue", sender: nil)
        
        self.lastTimeLabel.text = self.timeText.text
        self.milesPerHour = 0
        let speed = 0.1
    }
    
    func reset {
        self.timeText.text = "--- -- ----"
        self.currentSpeed.text
        milesPerHour = 0
        self.speedometer.text = "0 MPH"
    
    }
    
    func updateMiles() {
        self.milesPerHour += 1
       
        if milesPerHour == 88 {
            self.timer?.invalidate()
        }
        self.currentSpeed.text = "\(milesPerHour) MPH"
    
    
    }
    
    self.timer = NSTimer.scheduledTimerWithTimeInterval(speed,
                                                               target: self,
                                                             selector: #selector(updateMiles),
                                                             userInfo: nil,
                                                              repeats: true)

    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
    dateEnter()
        
    self.timeText.resignFirstResponder()
    
    return true
    }





