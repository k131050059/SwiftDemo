//
//  WebViewController.swift
//  SwiftEXAIDDemo
//
//  Created by 高鑫 on 2017/11/9.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UITabBarController {
    var url: String?
    var exTitle: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = exTitle!
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64))
        self.view.addSubview(webView)
        if let exUrl = URL(string: url!) {
            let request = URLRequest(url: exUrl)
            webView.load(request)
        }
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

}
