//
//  SettingsViewController.swift
//  Carousel Prototype
//
//  Created by Belinda Preno on 8/17/14.
//  Copyright (c) 2014 bp. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSizeMake(320, settingsImageView.image.size.height)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 64
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 64
        scrollView.scrollIndicatorInsets.bottom = 50
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onCloseButton(sender: AnyObject) {
         dismissViewControllerAnimated(true, completion: nil)
    }
    

}
