//
//  ViewController.swift
//  SwiftVideoDemo
//
//  Created by 高鑫 on 2017/11/6.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let videoImgs : [String] = ["1","2","3","4","5"]
    var playVideoController = AVPlayerViewController()
    var videoPlayer = AVPlayer()
    //!大概也有两种使用场景
    //1.强制对Optional值进行拆包(unwrap)
    //2.声明Implicitly Unwrapped Optionals值，一般用于类中的属性 直译就是隐式拆包的Optional
    @IBOutlet weak var videoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoTableView.delegate = self
        videoTableView.dataSource = self
        videoTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoImgs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell
        cell.selectionStyle = .none
        let img = videoImgs[indexPath.row]
        cell.playImg.image = UIImage(named: img)
//        cell.playBtn.addTarget(self, action: #selector(playAction(_:)), for: .touchUpInside)
        cell.playBtn.addTarget(self, action: #selector(playAction(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func playAction(_ sender: UIButton) {
 
        let path = Bundle.main.path(forResource: "清醒梦", ofType: "mp3")
        videoPlayer = AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
        playVideoController.player = videoPlayer
        self.present(playVideoController, animated: true) {
            self.playVideoController.player?.play()
        }
        
    }
}

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playImg: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var bgView: UIView!
    
}

