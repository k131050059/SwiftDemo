//
//  ViewController.swift
//  SwiftTransitionDemo
//
//  Created by 高鑫 on 2017/11/7.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    var secondViewController = SecondViewController()
    @IBOutlet weak var transitionBtn: UIButton!
    @IBAction func transitionBtnAction(_ sender: UIButton) {
        self.present(secondViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionBtn.layer.cornerRadius = 30
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.transitioningDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Transition()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Dismiss()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return secondViewController.percentDrivenTransition
    }
}


