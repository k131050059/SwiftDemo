//
//  RotateLoadingAnimationController.swift
//  SwiftTest
//
//  Created by sjl on 2019/4/6.
//  Copyright © 2019 sjl. All rights reserved.
//

import UIKit
class RotateLoadingAnimationController: UIViewController{
    var rotateAnimationView :  CLRotateAnimationView = CLRotateAnimationView(frame: CGRect(x: 0, y: 0, width: 80, height: 80));
     var waveViewtest: waveView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView:UIScrollView = UIScrollView(frame: self.view.bounds)
        scrollView.contentSize=CGSize(width: self.view.frame.size.width, height: 2000)
        self.view = scrollView
        self.view.backgroundColor=UIColor.white
        do{
            
            rotateAnimationView.updateWithConfigure { (configure) -> (Void) in
                configure.backgroundColor = UIColor.orange;
                configure.number = 8;
                configure.duration = 3;
                configure.intervalDuration = 0.12;
            }
            rotateAnimationView.startAnimation()
            self.view.addSubview(rotateAnimationView)
        }
        let button = UIButton.init(frame:CGRect(x: 100, y: 0, width: 100, height: 50))
        button.backgroundColor=UIColor.red
        button.setTitle("加速", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(jiabuttonClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        
        let adbutton = UIButton.init(frame:CGRect(x: 220, y: 0, width: 100, height: 50))
        adbutton.backgroundColor=UIColor.red
        adbutton.setTitle("减速", for: UIControl.State.normal)
        adbutton.addTarget(self, action: #selector(jianbuttonClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(adbutton)
        
        
        do {
            let roundAnimationView = SNRoundAnimationView(frame: CGRect(x: 0, y: 150, width: 90, height: 90))
            roundAnimationView.updateWithConfigure { (configure) -> (Void) in
                configure.outBackgroundColor = UIColor(red:1.00, green:0.00, blue:0.01, alpha:0.60)
                configure.inBackgroundColor = UIColor(red:0.28, green:0.54, blue:0.96, alpha:1.00)
                configure.duration = 1
                configure.strokeStart = 0
                configure.strokeEnd = 0.25
                configure.inLineWidth = 5
                configure.outLineWidth = 15
                configure.position = .animationOut
            }
            view.addSubview(roundAnimationView)
            roundAnimationView.startAnimation()
        }
        
        let WaterView = WaterWaveView(frame: CGRect(x:0, y: 250, width: 320, height: 40))
        self.view.addSubview(WaterView)
        
        WaterView.starAnimation()  // 开始动画
        
        
        waveViewtest = waveView(frame: CGRect(x: 0, y: 410, width: view.frame.size.width, height: 150))
        waveViewtest.alpha = 0.6
        waveViewtest.updateWithConfigure({ (configure) in
            configure.color = UIColor.orange;
            configure.y = 120
            configure.speed = 0.05
            configure.upSpeed = 0.1
        })
        view.addSubview(waveViewtest)
        
        
    }
    
    @objc func jiabuttonClick(){
        print("加速")
        rotateAnimationView.updateWithConfigure { (configure) -> (Void) in
            if configure.duration != 1{
            configure.duration = configure.duration-1;
            }
            configure.intervalDuration = 0.12;
        }
        rotateAnimationView.stopAnimation()
        rotateAnimationView.startAnimation()
    }
    @objc func jianbuttonClick(){
        print("减速")
        rotateAnimationView.updateWithConfigure { (configure) -> (Void) in
            configure.duration = configure.duration+1;
            configure.intervalDuration = 0.12;
        }
        rotateAnimationView.stopAnimation()
        rotateAnimationView.startAnimation()
    }
    deinit {
        waveViewtest.invalidate()
    }
}
