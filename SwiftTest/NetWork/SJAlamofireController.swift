//
//  SJAlamofireController.swift
//  SwiftTest
//
//  Created by sjl on 2019/4/11.
//  Copyright © 2019 sjl. All rights reserved.
//
import Alamofire
import UIKit
class SJAlamofireController:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let adbutton = UIButton.init(frame:CGRect(x: 0, y: 0, width: 100, height: 50))
        adbutton.backgroundColor=UIColor.red
        adbutton.setTitle("请求", for: UIControl.State.normal)
        adbutton.addTarget(self, action: #selector(netClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(adbutton)
    }
    @objc func netClick(){
        print("网络请求")
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response.request)  // 原始的URL请求
            print(response.response) // HTTP URL响应
            print(response.data)     // 服务器返回的数据
            print(response.result)   // 响应序列化结果，在这个闭包里，存储的是JSON数据
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
}
