//
//  ViewController.swift
//  SwiftDrawDemo
//
//  Created by 高鑫 on 2017/11/28.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    @IBAction func changeColorBtn(_ sender: UIButton) {
        switch sender.tag {
        case 100:
            drawView.cleanAll()
        case 101:
            drawView.strokeColor = UIColor.black
        case 102:
            drawView.strokeColor = UIColor.red
        case 103:
            drawView.strokeColor = UIColor.orange
        case 104:
            drawView.strokeColor = UIColor(named: "sys_blue")!
        case 105:
            drawView.strokeColor = UIColor(named: "sys_purple")!
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

