//
//  TermsViewController.swift
//  Carousel Prototype
//
//  Created by Belinda Preno on 8/17/14.
//  Copyright (c) 2014 bp. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
    @IBOutlet weak var termsWebView: UIWebView!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://www.dropbox.com/terms2014")
        let request = NSURLRequest(URL: url)
        termsWebView.loadRequest(request)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCloseButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
