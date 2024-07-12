//
//  ThirdViewController.swift
//  SwiftTabbarDemo
//
//  Created by 高鑫 on 2017/11/8.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var table : ThirdTableViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "table" {
            table = segue.destination as? ThirdTableViewController
        }
    }
}
