//
//  SignUpViewController.swift
//  Carousel Prototype
//
//  Created by Belinda Preno on 8/17/14.
//  Copyright (c) 2014 bp. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var createView: UIView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var termsButton: UIButton!

    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)


        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(sender: AnyObject) {
        
        self.view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    
    func keyboardWillShow(notification: NSNotification!) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.createView.center.y -= 125
            self.formView.center.y -= 215
        })
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.createView.center.y += 125
            self.formView.center.y += 215
            
        })
    }

    @IBAction func onTermsButton(sender: AnyObject) {
        
        if(termsButton.selected) {
            termsButton.selected = false
        } else {
            termsButton.selected = true
        }

    }
    
    @IBAction func onCreateButton(sender: AnyObject) {
        
        var invalidCredentials = UIAlertView(title: "Error", message: "Please provide your name, email address, and a secure password to sign up", delegate: self, cancelButtonTitle: "OK")
        
        // Check non-nil values
        if(firstNameField.text == "" || lastNameField.text == "" || emailField.text == "" || passwordField.text == "") {
            invalidCredentials.show()
        } else {
            if(termsButton.selected == false) {
                invalidCredentials.title = "Accept terms to continue"
                invalidCredentials.message = nil
                invalidCredentials.show()
            } else {
                // Prepare loading alert
                var loadingView = UIAlertView()
                loadingView.title = "Signing in"
                
                // Show loading alert
                loadingView.show()
                
                // After a 2 second delay...
                delay(2, closure: {
                    
                    // Dismiss the loading alert
                    loadingView.dismissWithClickedButtonIndex(0, animated: true)
                    
                    // Segue to the welcome screens
                    self.performSegueWithIdentifier("SignUpSegue", sender: self)
                })
            }
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
