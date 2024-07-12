//
//  SecondViewController.swift
//  SwiftTransitionDemo
//
//  Created by 高鑫 on 2017/11/7.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var percentDrivenTransition : UIPercentDrivenInteractiveTransition?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let dismissBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        dismissBtn.center.x = UIScreen.main.bounds.size.width / 2
        dismissBtn.center.y = UIScreen.main.bounds.size.height / 2 + 20
        dismissBtn.setTitle("返回", for: .normal)
        dismissBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        dismissBtn.tintColor = UIColor.white
        dismissBtn.layer.cornerRadius = 30
        dismissBtn.backgroundColor = UIColor.darkGray
        dismissBtn.addTarget(self, action: #selector(dismissAction(_:)), for: .touchUpInside)
        self.view.addSubview(dismissBtn)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panAction(panGesture:)))
        self.view.addGestureRecognizer(panGesture)
        // Do any additional setup after loading the view.
    }
    
    @objc func panAction(panGesture: UIPanGestureRecognizer) {
        let panPercent = panGesture.translation(in: self.view).x / self.view.frame.width
        
        switch panGesture.state {
        case .began:
            self.percentDrivenTransition = UIPercentDrivenInteractiveTransition()
            self.dismiss(animated: true, completion: nil)
        case .changed:
            self.percentDrivenTransition?.update(panPercent)
        case .ended, .cancelled:
            if panPercent > 0.5 {
                self.percentDrivenTransition?.finish()
            } else {
                self.percentDrivenTransition?.cancel()
            }
            self.percentDrivenTransition = nil
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
