//
//  SecondViewController.swift
//  SwiftTabbarDemo
//
//  Created by 高鑫 on 2017/11/8.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit
import AVKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let videoImgs : [String] = ["1","2","3","4","5"]
    var playVideoController = AVPlayerViewController()
    var videoPlayer = AVPlayer()
    @IBOutlet weak var videoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        videoTableView.delegate = self
        videoTableView.dataSource = self
        videoTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoImgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "twoCell", for: indexPath) as! VideoTableViewCell
        cell.selectionStyle = .none
        let img = videoImgs[indexPath.row]
        cell.playImg.image = UIImage(named: img)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playImg: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var bgView: UIView!
    
}
