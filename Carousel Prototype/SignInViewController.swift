//
//  SignInViewController.swift
//  Carousel Prototype
//
//  Created by Belinda Preno on 8/17/14.
//  Copyright (c) 2014 bp. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var loginFormView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signInButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.loginFormView.center.y -= 100
            self.signInButtonView.center.y -= 250
        })
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.loginFormView.center.y += 100
            self.signInButtonView.center.y += 250

        })
    }
    
    @IBAction func onTap(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    @IBAction func onSignInButton(sender: AnyObject) {
        
        var emptyCredentials = UIAlertView(title: "Email and password required", message: "Please sign in with your Dropbox email address and password", delegate: self, cancelButtonTitle: "OK")
        
         var invalidCredentials = UIAlertView(title: "Incorrect email or password", message: "Please sign in with your Dropbox email address and password", delegate: self, cancelButtonTitle: "OK")
        
        if(emailTextField.text.isEmpty || passwordTextField.text.isEmpty) {
            emptyCredentials.show()
        } else {
            var loadingView = UIAlertView()
            loadingView.title = "Signing in"
            
            loadingView.show()
            
            delay(2, closure: {
                loadingView.dismissWithClickedButtonIndex(0, animated: true)
                
                if (self.emailTextField.text != "user" || self.passwordTextField.text != "letmein") {
                    
                    invalidCredentials.show()
                    
                } else {
                    
                    self.performSegueWithIdentifier("SignInSegue", sender: self)
                    
                }
            })
        }

            
            
        }
    
    

}
