//
//  DrawView.swift
//  SwiftDrawDemo
//
//  Created by 高鑫 on 2017/11/28.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class DrawView: UIView {

    public var strokeColor: UIColor = UIColor.black
    fileprivate var lineWidth : CGFloat = 3
    fileprivate var allLines : [[CGPoint]] = []
    fileprivate var currentPoints : [CGPoint] = []
    fileprivate var strokeColors : [CGColor] = []
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setLineCap(.round)
        context?.setLineJoin(.round)
        
        if allLines.count > 0 {
            for i in 0..<allLines.count {
                let linePoints = allLines[i]
                if linePoints.count > 0 {
                    context?.beginPath()
                    context?.move(to: linePoints[0])
                    for j in 0..<linePoints.count {
                        context?.addLine(to: linePoints[j])
                    }
                    context?.setLineWidth(self.lineWidth)
                    context?.setStrokeColor(strokeColors[i])
                    context?.strokePath()
                }
            }
        }
        
        if currentPoints.count > 0 {
            context?.beginPath()
            context?.setLineWidth(self.lineWidth)
            context?.setStrokeColor(self.strokeColor.cgColor)
            context?.move(to: currentPoints[0])
            for i in 0..<currentPoints.count {
                context?.addLine(to: currentPoints[i])
            }
            context?.strokePath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let startPoint: CGPoint = (event?.allTouches?.first?.location(in: self))!
        currentPoints.append(startPoint)
        self.setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let movePoint: CGPoint = (event?.allTouches?.first?.location(in: self))!
        currentPoints.append(movePoint)
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        allLines.append(currentPoints)
        strokeColors.append(self.strokeColor.cgColor)
        currentPoints.removeAll()
        self.setNeedsDisplay()
    }
    
    func cleanAll() {
        allLines.removeAll()
        currentPoints.removeAll()
        strokeColors.removeAll()
        self.setNeedsDisplay()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
