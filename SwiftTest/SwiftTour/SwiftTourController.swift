//
//  SwiftTourController.swift
//  SwiftTest
//
//  Created by sjl on 2022/3/27.
//  Copyright © 2022 sjl. All rights reserved.
//

import UIKit
import SnapKit

class SwiftTourController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let colorView = UIView()
        colorView.backgroundColor = UIColor.cyan
        view.addSubview(colorView)
        colorView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalTo(view)
        }
        let view2 = UIView()
        view2.backgroundColor = .magenta
        colorView.addSubview(view2)
        view2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.right.equalToSuperview().offset(-20)
        }
 
        // Do any additional setup after loading the view, typically from a nib.
    }

    
}
