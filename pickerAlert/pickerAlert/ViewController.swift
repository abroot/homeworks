//
//  ViewController.swift
//  pickerAlert
//
//  Created by 福田隆史 on 2017/09/05.
//  Copyright © 2017年 f.R. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    @IBOutlet weak var picker: UIPickerView!

    var iosMem = ["うめさん","つちさん","えりかさん","りょう","しんた","えりこ先生"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.dataSource = self
        picker.delegate = self
    }
    
    // 列数を決定する
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1    // 1列に指定
    }
    
    // 行数を決定する
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //配列の要素の個数と同じ数を設定
        return iosMem.count
    }
    
    
    // 表示する文字の設定
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return iosMem[row] //String型
        
    }
    
    // 選択したときの処理
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let alert = UIAlertController(title: "iosMember", message: "\(iosMem[row])", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style:  .default, handler: nil))
        present(alert,animated: true,completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

