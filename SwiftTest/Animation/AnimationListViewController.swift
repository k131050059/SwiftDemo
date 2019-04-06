//
//  AnimationListViewController.swift
//  SwiftTest
//
//  Created by sjl on 2019/4/6.
//  Copyright © 2019 sjl. All rights reserved.
//

import UIKit
class AnimationListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let titles = ["转圈和按钮", "基本控件"]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.backgroundColor =  UIColor.white
        view.addSubview(tableView)
        tableView.delegate=self
        tableView.dataSource=self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CellIdentifier")
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = RotateLoadingAnimationController()
            vc.title = titles[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 1:
            let vc = BasicUIViewController()
            vc.title = titles[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            
            break
        }
    }
    
    
    
}
