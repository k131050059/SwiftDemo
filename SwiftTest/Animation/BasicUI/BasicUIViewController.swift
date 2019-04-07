//
//  BasicUIViewController.swift
//  SwiftTest
//
//  Created by sjl on 2019/4/6.
//  Copyright © 2019 sjl. All rights reserved.
//

import UIKit

class BasicUIViewController: UIViewController, UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {

    
    var redview:UIView = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
//    屏幕宽
    private var ScreenW :CGFloat!
    var dataArray: Array<Array<String>> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ScreenW = self.view.frame.size.width
        let scrollView:UIScrollView = UIScrollView(frame: self.view.bounds)
        scrollView.contentSize=CGSize(width: ScreenW, height: 2000)
        self.view = scrollView
    
        self.view.backgroundColor=UIColor.white
        redview.backgroundColor=UIColor.red
        self.view.addSubview(redview)
        
        self.initUIlabel()
        self.initUISegmentedControl()
        self.initUITextField()
        self.initUISlider()
        self.initUISwitch()
        self.initUIActivityIndicatorView()
        self.initUIProgressView()
        self.initUIPageControl()
        self.initUIStepper()
        self.initUIDatePicker()
        self.initUIPickerView()
        
        let button = UIButton.init(frame:CGRect(x: 150, y: 50, width: 50, height: 50))
        button.backgroundColor=UIColor.red
        button.setTitle("位移", for: UIControl.State.normal)
//        button.addTarget(self, action: #selector(transformClick), for: UIControl.Event.touchUpInside)
        button.addTarget(self, action: #selector(transformClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
    }
    
    
    private func initUIlabel(){
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: ScreenW, height: 50))
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .black
        label.numberOfLines=0
        label.textAlignment = NSTextAlignment.center
        label.text = "UIlabel,UIbutton,UIview,UISegmentedControl,UITextField,UISlider,UISwitch,UIActivityIndicatorView,UIProgressViewUIPageControl,UIStepper,UIDatePicker,UIPickerView"
        view.addSubview(label)
    }

    @objc func transformClick(){
        redview.frame = CGRect(x: 200, y: 0, width: 50, height: 50)
    }
    
    private func initUISegmentedControl(){
        let segmentedControl:UISegmentedControl = UISegmentedControl(items: ["1","2","3"])
        segmentedControl.frame = CGRect(x: 0, y: 100, width: 150, height: 30)
        segmentedControl.addTarget(self, action:#selector(segmentedControlValueChanged) , for: UIControl.Event.valueChanged)
        segmentedControl.selectedSegmentIndex = 0 //默认
        view.addSubview(segmentedControl)
    }
    // MARK: 用户点击UISegmentedControl
    @objc func segmentedControlValueChanged(segmentedControl:UISegmentedControl) {
        self.title = "UISegmentedControl(\(segmentedControl.selectedSegmentIndex))"
    }
    
    private func initUITextField() {
        let textField:UITextField = UITextField(frame: CGRect(x: 0, y: 150, width: ScreenW, height: 40))
        textField.backgroundColor = UIColor.orange
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.delegate = self
        textField.keyboardType = UIKeyboardType.URL
        textField.placeholder = "请输入"
        textField.textAlignment = .left
        textField.isSecureTextEntry = true
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = .always
        let leftImg = UIImageView.init(frame:CGRect(x: 0, y: 0, width: 40, height: 40))
        leftImg.image = UIImage.init(named:"left_img")
        textField.leftView = leftImg
        view.addSubview(textField)
        
    }
    //uitextfielddelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    // MARK: 实现监听返回按钮
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()// 关闭键盘
        navigationController?.setNavigationBarHidden(false, animated: true)
        return true
    }
    
    func initUISlider(){
        let slider: UISlider = UISlider(frame: CGRect(x: 0, y: 200, width: ScreenW, height: 30))
        slider.minimumValue = 0// 指定可变最小值
        slider.maximumValue = 100// 指定可变最大值
        slider.value = 50    // 指定初始值
        slider.addTarget(self, action:#selector(sliderValueChanged) , for: UIControl.Event.valueChanged)
        self.view.addSubview(slider)
    }
    @objc func sliderValueChanged(slider: UISlider) {
        self.title = "UISlider:\(slider.value)"
    }
 
    private func initUISwitch() {
        let uiSwitch = UISwitch(frame:CGRect(x: 0, y: 230, width: ScreenW, height: 30))
        uiSwitch.tintColor = UIColor.blue// 未打开时背景色
        uiSwitch.onTintColor = UIColor.green// 打开时背景色
        uiSwitch.addTarget(self, action:#selector(switchValueChanged) , for:UIControl.Event.valueChanged)
       
        self.view.addSubview(uiSwitch)
    }
    
    // MARK: 用户点击UISwitch
    @objc func switchValueChanged(uiSwitch: UISwitch) {
        self.title = "UISwitch:\(uiSwitch.isOn)"
    }
    
    // MARK: - UIActivityIndicatorView
    private func initUIActivityIndicatorView() {
        let activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 260, width: 50, height: 50))//指定进度轮的大小
        activityIndicatorView.style = .whiteLarge// 显示样式
        activityIndicatorView.backgroundColor = UIColor.green// 背景色
        activityIndicatorView.alpha = 0.5// 透明度
        //设置背景为圆角矩形
        activityIndicatorView.layer.cornerRadius = 6;
        activityIndicatorView.layer.masksToBounds = true;
        activityIndicatorView.startAnimating()// 开始
 
        self.view.addSubview(activityIndicatorView)
    }
    // MARK: - UIProgressView
    private func initUIProgressView() {
        let progressView = UIProgressView(frame:  CGRect(x: 0, y: 310, width: 150, height: 5))
        progressView.progressViewStyle = .default// 进度条样式
        
        self.view.addSubview(progressView)
        // 0.5秒触发一次
 
//        let timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeNSTimer), userInfo: progressView, repeats: true)
//        timer.fire()// 启动
    }
    // MARK: - 时间触发器
    @objc func changeNSTimer(timer: Timer) {
        let progressView: UIProgressView? = timer.userInfo as? UIProgressView
        let pageControl: UIPageControl? = timer.userInfo as? UIPageControl
        if (progressView != nil) {
            var progress = progressView!.progress
            progress = progress == 1 ? 0 : progress + 0.01
            progressView!.progress = progress
         } else if (pageControl != nil) {
            var currentPage = pageControl!.currentPage
            currentPage = currentPage == pageControl!.numberOfPages - 1 ? 0 : currentPage + 1
            pageControl!.currentPage = currentPage
            self.title = "UIProgressView:\(currentPage)"
        }
    }
    
    // MARK: - UIPageControl
    private func initUIPageControl() {
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: 320, width: 150, height: 5))
        pageControl.numberOfPages = 10// 默认10页
        pageControl.currentPage = 1// 选中第1页
        pageControl.pageIndicatorTintColor = UIColor.green// 默认背景色
        pageControl.currentPageIndicatorTintColor = UIColor.blue// 选中时背景色
         self.view.addSubview(pageControl)
        // 0.5秒触发一次
//        let timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(changeNSTimer), userInfo: pageControl, repeats: true)
//        timer.fire()// 启动
    }
    
    // MARK: - UIStepper
    private func initUIStepper() {
        let stepper = UIStepper(frame: CGRect(x: 0, y: 330, width: 150, height: 5))
        stepper.maximumValue = 10// 最大
        stepper.minimumValue = 0// 最小
        stepper.value = 5// 默认
        stepper.stepValue = 0.1// 每次增加
        stepper.isContinuous = true// 按住不放来连续更改数值
        stepper.wraps = true// 是否循环（到最大值时再增加数值最从最小值开始）
        stepper.addTarget(self, action: #selector(stepperValueChanged) , for: UIControl.Event.valueChanged)
         self.view.addSubview(stepper)
    }
    
    // MARK: 用户点击UIStepper
    @objc func stepperValueChanged(stepper: UIStepper) {
        self.title = "UIStepper:\(stepper.value)"
    }
    
    // MARK: - UIDatePicker
    private func initUIDatePicker() {
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 340, width: ScreenW, height: 400))
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime //设置样式，当前设为同时显示日期和时间
        datePicker.minuteInterval = 5// 设置分钟表盘的时间间隔（必须能让60整除，默认是1分钟）
        datePicker.addTarget(self, action:#selector(datePickerValueChanged), for: UIControl.Event.valueChanged)
        // 设置日期范围（超过日期范围，会回滚到最近的有效日期）
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        datePicker.maximumDate = dateFormatter.date(from: "2018-05-16 08:00:00")
        datePicker.minimumDate = dateFormatter.date(from: "2020-07-16 08:00:00")
         datePicker.setDate(Date(), animated: true)// 回到默认日期
  
        self.view.addSubview(datePicker)
    }
    
    // MARK: 用户选中UIDatePicker
    @objc func datePickerValueChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        self.title = "\(dateFormatter.string(from: datePicker.date))"
    }
    
  
    // MARK: - UIPickerView
    private func initUIPickerView() {
        // 数据源
        dataArray.append(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])
        dataArray.append(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 740, width: ScreenW, height: 400))
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.showsSelectionIndicator = true
  
        self.view.addSubview(pickerView)
    }
    
    // MARK: UIPickerViewDataSource
    // MARK: 列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return self.dataArray.count
    }
    
 
    // MARK: 行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataArray[component].count
    }
    
    // MARK: UIPickerViewDelegate
    // MARK: 列宽
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 40
    }
    
    // MARK: 行高
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44
    }
    
    // MARK: 每行每列显示的数据
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 也可以实现func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView 二者取其一
        let array: Array = self.dataArray[component]
        return array[row]
    }
 
    // MARK: 用户选中UIPickerView
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(component)-\(row)")
        let first = self.dataArray[0][pickerView.selectedRow(inComponent: 0)]
        let second = self.dataArray[1][pickerView.selectedRow(inComponent: 1)]
        self.title = "UIPickerView:\(first)\(second)"
    }
    
 
}
