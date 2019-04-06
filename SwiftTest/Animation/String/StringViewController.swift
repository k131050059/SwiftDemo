//
//  StringViewController.swift
//  SwiftTest
//
//  Created by sjl on 2019/4/6.
//  Copyright © 2019 sjl. All rights reserved.
//

import UIKit
class StringViewController: UIViewController {
    var publabel:UILabel!
    var test1:UILabel!
    var test2:UILabel!
    private var ScreenW :CGFloat!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        view.backgroundColor = .white
        
        ScreenW = self.view.frame.size.width
        publabel = UILabel(frame: CGRect(x: 0, y: 0, width: ScreenW, height: 50))
        publabel.backgroundColor = UIColor.orange
        publabel.font = UIFont.systemFont(ofSize: 17)
        publabel.textColor = .black
        publabel.numberOfLines=0
        publabel.textAlignment = NSTextAlignment.center
        view.addSubview(publabel)
        
        test1 = UILabel(frame: CGRect(x: 0, y: 55, width: ScreenW, height: 20))
        test1.backgroundColor = .white
        test1.font = UIFont.systemFont(ofSize: 11)
        test1.textColor = .black
        test1.numberOfLines=0
        test1.text = "   过滤空 格    格"
        test1.textAlignment = NSTextAlignment.left
        view.addSubview(test1)
        
        let button = UIButton.init(frame:CGRect(x: 0, y: 75, width: 70, height: 40))
        button.backgroundColor=UIColor.red
        button.setTitle("过滤", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(guolvClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        
        test2 = UILabel(frame: CGRect(x: 0, y: 115, width: ScreenW, height: 20))
        test2.backgroundColor = .white
        test2.font = UIFont.systemFont(ofSize: 11)
        test2.textColor = .black
        test2.numberOfLines=0
        test2.text = "qwer123423qadsf234"
        test2.textAlignment = NSTextAlignment.left
        view.addSubview(test2)
        let button2 = UIButton.init(frame:CGRect(x: 0, y: 135, width: 170, height: 40))
        button2.backgroundColor=UIColor.red
        button2.setTitle("正则过滤字母", for: UIControl.State.normal)
        button2.addTarget(self, action: #selector(button2Click), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button2)
        
    }
    @objc func guolvClick(){
        publabel.text=test1.text?.replacingOccurrences(of: " ", with: "")
    }
    
    @objc func button2Click(){
        let str1:String = test2.text!
        let pattern = "[a-zA-Z]"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
//        let str2 = regex.stringByReplacingMatches(in: str1, options: [], range: NSMakeRange(0, str1.count), withTemplate: "")
        
        let str3 = str1.pregReplace(pattern: pattern, with: "")
        publabel.text=str3
    }
    

 
}
extension String {
    //使用正则表达式替换
    func pregReplace(pattern: String, with: String,
                     options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [],
                                              range: NSMakeRange(0, self.count),
                                              withTemplate: with)
    }
}
