//
//  WelcomeViewController.swift
//  Carousel Prototype
//
//  Created by Belinda Preno on 8/17/14.
//  Copyright (c) 2014 bp. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var welcomeButton: UIButton!
    @IBOutlet weak var backUpSwitch: UISwitch!
    @IBOutlet weak var welcomeFrameView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(1280, 568)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        // Stage animation for the button that exits the welcome tutorial
        if (pageControl.currentPage == 3) {
            // Reveal the view
            self.welcomeFrameView.hidden = false
            
            // Animate alpha to 1
            UIView.animateWithDuration(0.5, animations: {
                self.welcomeFrameView.alpha = 1
            })
        } else {
            // Animate alpha with a callback that hides the view
            UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {
                self.welcomeFrameView.alpha = 0
                }, completion: { (Bool) -> Void in
                    self.welcomeFrameView.hidden = true
            })
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
