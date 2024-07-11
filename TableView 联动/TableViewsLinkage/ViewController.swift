//
//  ViewController.swift
//  TableViewsLinkage
//
//  Created by JSL on 2017/11/2.
//  Copyright © 2017年 JSL. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    var leftTableView = UITableView()
    var rightTableView = UITableView()
    var offsetY : CGFloat = 0.0
    var isScrollDown : Bool = true
    
    let leftData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    let rightCellData = ["1":["A"], "2":["B","BB"], "3":["C","CC","CCC"], "4":["D","DD","DDD","DDDD"], "5":["E","EE","EEE","EEEE","EEEEE"], "6":["F"], "7":["G","GG"], "8":["H","HH","HHH"], "9":["I","II","III","IIII"], "10":["J","JJ","JJJ","JJJJ","JJJJJ","K","KK","KKK","KKKK"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        leftTableView.delegate = self
        leftTableView.dataSource = self
        leftTableView.frame = CGRect(x: 0, y: 0, width: 50, height: h)
        leftTableView.showsVerticalScrollIndicator = false
        leftTableView.backgroundColor = UIColor(named: "x_red")
        leftTableView.tableFooterView = UIView()
        leftTableView.register(LeftTableViewCell.self, forCellReuseIdentifier: "leftCell")
        leftTableView.selectRow(at: IndexPath(row:0, section:0), animated: true, scrollPosition: .none)
        leftTableView.separatorColor = UIColor(named: "x_red")
        self.view.addSubview(leftTableView)
        
        rightTableView.delegate = self
        rightTableView.dataSource = self
        rightTableView.frame = CGRect(x: 50, y: 0, width: w - 50, height: h)
        rightTableView.showsVerticalScrollIndicator = false
        rightTableView.tableFooterView = UIView()
        rightTableView.register(RightTableViewCell.self, forCellReuseIdentifier: "rightCell")
        self.view.addSubview(rightTableView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if rightTableView == tableView {
            return leftData.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if leftTableView == tableView {
            return 50
        } else {
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if leftTableView == tableView {
            return leftData.count
        } else {
            return rightCellData[leftData[section]]!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if leftTableView == tableView {
            let leftCell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath) as! LeftTableViewCell
            leftCell.selectedBackgroundView = UIView()
            leftCell.selectedBackgroundView?.backgroundColor = UIColor.orange
            leftCell.label.text = leftData[indexPath.row]
            return leftCell
        } else {
            let rightCell = tableView.dequeueReusableCell(withIdentifier: "rightCell", for: indexPath) as! RightTableViewCell
            rightCell.label.text = rightCellData[leftData[indexPath.section]]![indexPath.row]
            return rightCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if leftTableView == tableView {
            return 0
        } else {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if leftTableView == tableView {
            return nil
        } else {
            let headerView = UITableViewHeaderFooterView(frame: CGRect(x: 0, y: 0, width: w-50, height: 20))
            let label = UILabel()
            label.frame.size = headerView.frame.size
            label.frame.origin = CGPoint(x: 0, y: 0)
            label.textAlignment = .center
            label.backgroundColor = UIColor.groupTableViewBackground
            label.text = leftData[section]
            headerView.addSubview(label)
            return headerView
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let tableView = scrollView as! UITableView
        if rightTableView == tableView {
            isScrollDown = offsetY < scrollView.contentOffset.y ? true : false
            offsetY = scrollView.contentOffset.y
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if (rightTableView == tableView) && !isScrollDown && rightTableView.isDragging {
            leftTableView.selectRow(at: IndexPath(row: section, section: 0), animated: true, scrollPosition: .top)
        }
    }

    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        if (rightTableView == tableView) && isScrollDown && rightTableView.isDragging {
            leftTableView.selectRow(at: IndexPath(row: section + 1, section: 0), animated: true, scrollPosition: .top)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if leftTableView == tableView {
            let headerRect = rightTableView.rect(forSection:indexPath.row)
            let topOfHeader = CGPoint(x: 0, y: headerRect.origin.y - rightTableView.contentInset.top)
            rightTableView.setContentOffset(topOfHeader, animated: true)
            leftTableView.scrollToRow(at: IndexPath(row: indexPath.row, section: 0), at: .top, animated: true)
        }
    }
}

class LeftTableViewCell: UITableViewCell {
    var label = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "leftCell")
        self.backgroundColor = UIColor(named: "x_red")
        label.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = UIColor.white
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class RightTableViewCell: UITableViewCell {
    var label = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "rightCell")
        label.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 50, height: 80)
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.textAlignment = .center
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


