//
//  FirstViewController.swift
//  SwiftTabbarDemo
//
//  Created by 高鑫 on 2017/11/8.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let news = News.newsArray
    var isPreviews : [Bool]? = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        for _ in 0..<news.count {
            let isPreview = true
            isPreviews?.append(isPreview)
        }
        tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight = isPreviews![indexPath.row] == true ? 130 : UITableViewAutomaticDimension
        return CGFloat(rowHeight)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! NewTableViewCell
        tableView.beginUpdates()
        cell.detailLabel.numberOfLines = cell.detailLabel.numberOfLines == 2 ? 0 : 2
        isPreviews![indexPath.row] = cell.detailLabel.numberOfLines == 2 ? true : false
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewTableViewCell
        cell.selectedBackgroundView = UIView()
        cell.selectedBackgroundView?.backgroundColor = UIColor.white
        cell.titleLabel.text = news[indexPath.row][0]
        cell.dateLabel.text = news[indexPath.row][1]
        cell.detailLabel.text = news[indexPath.row][2]
        cell.detailLabel.numberOfLines = isPreviews![indexPath.row] == true ? 2 : 0
        return cell
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

class NewTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel! {
        didSet {
            detailTextLabel?.numberOfLines = 2
        }
    }
}

