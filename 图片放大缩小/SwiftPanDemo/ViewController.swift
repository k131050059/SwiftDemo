//
//  ViewController.swift
//  SwiftPanDemo
//
//  Created by 高鑫 on 2017/11/10.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let infos = Model.infos
    let w = UIScreen.main.bounds.size.width
    let h = UIScreen.main.bounds.size.height
    var isShow : Bool = true
    var imgName : String = "1"
    
    fileprivate lazy var showImg : UIImageView = {
        let showImg = UIImageView()
        showImg.frame.size = CGSize(width: w, height: w)
        showImg.center = CGPoint(x: w / 2 , y: w / 2 + 64)
        showImg.image = UIImage(named: "1")
        showImg.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(tapGesture:)))
        showImg.addGestureRecognizer(tapGesture)
        return showImg
    }()
    fileprivate lazy var bgView : UIView = {
        let bgView = UIView(frame: CGRect(x: 0, y: 64, width: w, height: h -  64))
        bgView.backgroundColor = UIColor.black
        bgView.isHidden = true
        bgView.alpha = 0
        return bgView
    }()
    fileprivate lazy var selectView : UIView = {
        let selectView = UIView(frame: CGRect(x: 0, y: h - 50, width: w, height: h - w*0.5))
        selectView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.9)
        return selectView
    }()
    fileprivate lazy var headerView : UIView = {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: w, height: 50))
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panAction(panGesture:)))
        headerView.addGestureRecognizer(panGesture)
        return headerView
    }()
    fileprivate lazy var downBtn : UIButton = {
        let downBtn = UIButton()
        downBtn.frame.size = CGSize(width: 40, height: 25)
        downBtn.frame.origin.y = 10
        downBtn.center.x = w / 2
        downBtn.setImage(isShow ? #imageLiteral(resourceName: "backUp") : #imageLiteral(resourceName: "backDown"), for: .normal)
        downBtn.addTarget(self, action: #selector(showORback(_:)), for: .touchUpInside)
        return downBtn
    }()
    fileprivate lazy var tableView : UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 50, width: self.w, height: h - w*0.5 - 50))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.backgroundColor = UIColor.clear
        tableView.tableFooterView = UIView()
        tableView.register(tableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(showImg)
        self.view.addSubview(bgView)
        headerView.addSubview(downBtn)
        selectView.addSubview(headerView)
        selectView.addSubview(tableView)
        self.view.addSubview(selectView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        backBtnAction()
        tableView.deselectRow(at: indexPath, animated: true)
        let info = infos[indexPath.row]
        imgName = info.img
        self.showImg.image = UIImage(named: info.img)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tableViewCell
        let info = infos[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = UIView()
        cell.selectedBackgroundView?.backgroundColor = UIColor.darkGray.withAlphaComponent(0.9)
        cell.img.image = UIImage(named: info.img)
        cell.nameLabel.text = info.name
        return cell
    }
    
    @objc func showORback(_ sender: UIButton) {
        if isShow == true {
            showBtnAction()
        } else {
            backBtnAction()
        }
    }
    
    func showBtnAction() {
        self.bgView.isHidden = false
        UIView.animate(withDuration: 0.4, animations: {
            self.showImg.frame.size = CGSize(width: self.w * 0.8, height: self.w * 0.8)
            self.showImg.center = CGPoint(x: self.w / 2, y: self.w / 2 + 64)
            self.bgView.alpha = 0.3
            self.selectView.frame.origin.y = self.w*0.5
        }) { (_) in
            self.isShow = false
            self.downBtn.setImage(#imageLiteral(resourceName: "backDown"), for: .normal)
        }
    }
    
    func backBtnAction() {
        UIView.animate(withDuration: 0.4, animations: {
            self.showImg.frame.size = CGSize(width: self.w, height: self.w)
            self.showImg.center = CGPoint(x: self.w / 2, y: self.w / 2 + 64)
            self.bgView.alpha = 0
            self.selectView.frame.origin.y = self.h - 50
        }) { (_) in
            self.bgView.isHidden = false
            self.isShow = true
            self.downBtn.setImage(#imageLiteral(resourceName: "backUp"), for: .normal)
        }
    }
    
    @objc func tapAction(tapGesture: UITapGestureRecognizer) {
        let imgViewController = ImgViewController()
        imgViewController.img = imgName
        self.present(imgViewController, animated: true, completion: nil)
    }
    
    var startPoint: CGFloat = 0
    var changePoint: CGFloat = 0
    var viewPoint: CGFloat = 0
    var movePoint: CGFloat = 0
    @objc func panAction(panGesture: UIPanGestureRecognizer) {

        switch panGesture.state {
        case .began:
            startPoint = panGesture.location(in: self.view).y
            viewPoint = self.selectView.frame.origin.y
        case .changed:
            changePoint = panGesture.location(in: self.view).y
            movePoint = viewPoint + (changePoint - startPoint)
            if movePoint > self.h - 50 {
                movePoint = self.h - 50
            } else if movePoint < self.w * 0.5 {
                movePoint = self.w * 0.5
            }
            self.selectView.frame.origin.y = movePoint
            let movePercent = (self.h - 50 - movePoint) / (self.h - 50 - self.w * 0.5)
            if movePercent != 0 {
                self.bgView.isHidden = false
            } else {
                self.bgView.isHidden = true
            }
            let zoomPercent = (1 - movePercent * 0.2)
            let bgPercent = movePercent * 0.3
            self.showImg.frame.size = CGSize(width: self.w * zoomPercent, height: self.w * zoomPercent)
            self.bgView.alpha = bgPercent
            self.showImg.center = CGPoint(x: self.w / 2, y: self.w / 2 + 64)
            panGesture.setTranslation(.zero, in: self.view)
        case .ended:
            if movePoint < self.w {
                showBtnAction()
            } else {
                backBtnAction()
            }
        default:
            break
        }
    }
}

class tableViewCell: UITableViewCell {
    var nameLabel = UILabel()
    var img = UIImageView()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "cell")
        
        img.frame = CGRect(x: 15, y: 10, width: 30, height: 30)
        self.addSubview(img)
        nameLabel.frame = CGRect(x: 55, y: 5, width: 300, height: 40)
        nameLabel.textColor = UIColor.white
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        self.addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
