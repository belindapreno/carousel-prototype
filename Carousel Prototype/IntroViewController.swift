//
//  IntroViewController.swift
//  Carousel Prototype
//
//  Created by Belinda Preno on 8/17/14.
//  Copyright (c) 2014 bp. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var yOffsets : [Float] = [-285, -240, -425, -408, -510, -500]
    var xOffsets : [Float] = [-60, 45, 10, 100, -115, -75]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func transformView(view: UIView!, atIndex index : Int, offset: Float) {
    
    }
    
    func updateViewTransformWithOffset(offset : Float) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introScrollView.contentSize = introImageView.image.size
        introScrollView.delegate = self
        
        introScrollView.sendSubviewToBack(introImageView)
        
        scrollViewDidScroll(introScrollView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        var offset = Float(introScrollView.contentOffset.y)
        
        // content offset: 0->568
        //x offset: -60->0
        //y offset: -285->0
        
        var view1tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -60, r2Max: 0)
        var view1ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        var view1scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var view1rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(view1tx), CGFloat(view1ty))
        
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(view1scale), CGFloat(view1scale))
        
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(view1rotation) * M_PI / 180))
        
        //content offset: 0->568
        //x offset: 45->0
        //y offset: -240->0

        var view2tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 45, r2Max: 0)
        var view2ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -240, r2Max: 0)
        var view2scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var view2rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)

        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(view2tx), CGFloat(view2ty))

        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(view2scale), CGFloat(view2scale))

        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(view2rotation) * M_PI / 180))
//
        //content offset: 0->568
        //x offset: 10->0
        //y offset: -425->0
        
        var view3tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        var view3ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -425, r2Max: 0)
        var view3scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        var view3rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(view3tx), CGFloat(view3ty))
        
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(view3scale), CGFloat(view3scale))
        
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(view3rotation) * M_PI / 180))
        
        //content offset: 0->568
        //x offset: 100->0
        //y offset: -408->0
        
        var view4tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 100, r2Max: 0)
        var view4ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -408, r2Max: 0)
        var view4scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        var view4rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(view4tx), CGFloat(view4ty))
        
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(view4scale), CGFloat(view4scale))
        
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(view4rotation) * M_PI / 180))
        
        //content offset: 0->568
        //x offset: -115->0
        //y offset: -510->0
        
        var view5tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -115, r2Max: 0)
        var view5ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -510, r2Max: 0)
        var view5scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var view5rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(view5tx), CGFloat(view5ty))
        
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(view5scale), CGFloat(view5scale))
        
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(view5rotation) * M_PI / 180))
        
        //content offset: 0->568
        //x offset: -75->0
        //y offset: -500->0
        
        var view6tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -75, r2Max: 0)
        var view6ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -500, r2Max: 0)
        var view6scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var view6rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(view6tx), CGFloat(view6ty))
        
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(view6scale), CGFloat(view6scale))
        
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(view6rotation) * M_PI / 180))

        
        
    }
    

}
