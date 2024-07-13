//
//  ViewController.swift
//  SwiftNotificationDemo
//
//  Created by 高鑫 on 2017/11/18.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func doneBtn(_ sender: UIButton) {
        let date = datePicker.date
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.settingNotification(date: date)
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

