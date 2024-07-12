//
//  ImgViewController.swift
//  SwiftPanDemo
//
//  Created by 高鑫 on 2017/11/10.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ImgViewController: UIViewController, UIScrollViewDelegate {
    let w = UIScreen.main.bounds.size.width
    let h = UIScreen.main.bounds.size.height
    
    var img : String!
    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: w, height: w))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: img)
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = UIColor.clear
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        setZoomScaleFor(srollViewSize: scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        recenterImage()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dimAction(_:)))
        self.view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dimAction(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    func setZoomScaleFor(srollViewSize: CGSize) {
        
        let imageSize = imageView.bounds.size
        let widthScale = srollViewSize.width / imageSize.width
        let heightScale = srollViewSize.height / imageSize.height
        let minimunScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minimunScale
        scrollView.maximumZoomScale = 3.0
        
    }
    
    func recenterImage() {
        
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2.0 : 0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        recenterImage()
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
