//
//  ArrayController.swift
//  SwiftTest
//
//  Created by sjl on 2024/7/13.
//  Copyright © 2024 sjl. All rights reserved.
//
import UIKit
import Foundation

class ArrayController: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        //定义空数组
        var array1:Array<Int> = Array<Int>()
        var array2:[Int] = []
        var array3 = array2
        
        var threeInts = [Int](repeating: 5, count: 3)
        print("三个元素数组\(threeInts)")
        var sisInts = threeInts + threeInts
        print("两个三元素数组相加\(sisInts)")

        var fiveInts = [1,2,3,4,5]
        
        for value in fiveInts {
            print(value)
        }
        for (index,value) in fiveInts.enumerated() {
            print("\(index):\(value)")
        }
        
        fiveInts.forEach{print($0)}
        array1.append(1)
        array1 += [2,3,4]
        array1.insert(5, at: array1.endIndex)
         
        let arr1 = [1,2,3]
        var arr2 = arr1
//        withUnsafePointer(to: &arr1) {ptr in print("初始1", ptr)}
//        withUnsafePointer(to: &arr2) {ptr in print("初始2",  ptr)}

        arr2.append(4)
//        withUnsafePointer(to: &arr1) {ptr in print("变动2",  ptr)}

    }
    
}
