//
//  ViewController.swift
//  NotificationTester
//
//  Created by Lauren Hibbs on 4/7/16.
//  Copyright © 2016 Lauren Hibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numMinutes: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func scheduleNotifcation(sender: AnyObject) {
        
        //let calendar = NSCalendar.currentCalendar()
        //let date = calendar.dateByAddingUnit(.Minute, value: 5, toDate: startDate, options: [])
        
        if let isEmpty=numMinutes.text?.isEmpty where isEmpty==false
        {
            if let minutes = NSNumberFormatter().numberFromString(numMinutes.text!){
                print("Number of minutes is\(minutes)")
                
                if Int(minutes)*60<1
                {
                     showAlertWithTitle("Can't schedule notification" , message : "Please enter a value greater than 1. If you need help remembering something for the next 30 seconds try writing on the back of your hand...")
                    return
                }
                
                let date = NSDate();
                let notificationDate =  date.dateByAddingTimeInterval(Double(Int(minutes)*60))
                
                var notification = UILocalNotification();
                notification.alertTitle = " Test Notification "
                notification.alertBody = "This is the notification you scheduled!"
                //notification.alertAction = " open" // text that is displayed after "slide to". defaults to slide to view
                notification.fireDate = notificationDate
                notification.soundName = UILocalNotificationDefaultSoundName
                
                // notification.userInfo = [] pass custom information to the app when the notification is recieved/opened
                
                // notification.category used to do something for a specified category of actions, like buttons or stuff
                UIApplication.sharedApplication().scheduleLocalNotification(notification)
                print("Notification scheduled")
                
            }else{
                showAlertWithTitle("Can't schedule notification" , message : "I don't know about you, but I count time with numbers...")
            }
            
        }else
        {
             showAlertWithTitle("Can't schedule notification" , message : "If this is gonna work you have to coorperate with me. Try entering a number ")
            
        }
 
    }
    
    internal func handlePresentNotification(notification : UILocalNotification){
        showAlertWithTitle("Notification", message : " BAM! You have officially been notified")
    }
    
    
    private func showAlertWithTitle(title: String, message:String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction( title: " Dismiss" , style: .Default , handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
    }


}

