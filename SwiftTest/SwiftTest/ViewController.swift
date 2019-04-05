//
//  ViewController.swift
//  SwiftTest
//
//  Created by sjl on 2019/3/23.
//  Copyright © 2019 sjl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            let rotateAnimationView :  CLRotateAnimationView = CLRotateAnimationView(frame: CGRect(x: 120, y: 120, width: 80, height: 80));
            rotateAnimationView.updateWithConfigure { (configure) -> (Void) in
                configure.backgroundColor = UIColor.orange;
                configure.number = 8;
                configure.duration = 3;
                configure.intervalDuration = 0.12;
            }
            rotateAnimationView.startAnimation()
            self.view.addSubview(rotateAnimationView)
        }

        // Do any additional setup after loading the view, typically from a nib.
    }


}

