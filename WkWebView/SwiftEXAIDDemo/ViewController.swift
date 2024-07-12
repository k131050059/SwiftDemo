//
//  ViewController.swift
//  SwiftEXAIDDemo
//
//  Created by 高鑫 on 2017/11/9.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let exInfo = Model.exaidInfo
    
    @IBOutlet weak var exTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item
        exTableView.delegate = self
        exTableView.dataSource = self
        exTableView.rowHeight = 150
        exTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        exTableView.tableFooterView = UIView()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EXTableViewCell
        cell.selectedBackgroundView = UIView()
        cell.selectedBackgroundView?.backgroundColor = UIColor(named: "selectPink")
        let info = exInfo[indexPath.row]
        cell.titleLabel.text = info.name
        cell.detailLabel.text = info.detail
        cell.exImg.image = UIImage(named: info.img)
        return cell
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "web" {
            let web = segue.destination as! WebViewController
            let info = exInfo[exTableView.indexPathForSelectedRow!.row]
            web.url = info.url
            web.exTitle = info.name
            
        }
    }

}

class EXTableViewCell: UITableViewCell {
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var exImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
}

