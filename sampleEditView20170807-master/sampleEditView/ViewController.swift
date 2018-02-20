//
//  ViewController.swift
//  sampleEditView
//
//  Created by Eriko Ichinohe on 2017/09/26.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet weak var formView: UIView!
    
    @IBOutlet weak var myTitle: UITextField!
    
    @IBOutlet weak var myDate: UITextField!
    
    @IBOutlet weak var myContents: UITextView!
    
    //datePickerが乗るView（下に隠しておく）
    let baseView:UIView = UIView(frame: CGRect(x: 0, y: 720, width: 250, height: 250))
    
    //載せるdatePicker
    let myDatePicker:UIDatePicker = UIDatePicker(frame: CGRect(x: 10, y: 20, width: 300, height: 220))
    
    //baseViewを閉じるためのボタン
    let closeDButton:UIButton = UIButton(type: .system)
    
    //formviewが上がってるか下がってるか認識するflag
    var flag:Bool = true
    
    //pickerで日付が選択されたらよびだされる
    func putDate(sender: UIDatePicker){
        
        //フォーマット設定（文字列に変換）
        let df = DateFormatter()
        df.dateFormat = "yyyy / MM / dd"
        
        //日付型ー＞文字列
        let str = df.string(from: sender.date)
        myDate.text = str
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //datepickerを日付モードに
        myDatePicker.datePickerMode = UIDatePickerMode.date
        
        //日付が選択されたら実行
        myDatePicker.addTarget(self, action: #selector(putDate(sender:)), for: .valueChanged)
        
        // baseViewにdatePickerを配置
        baseView.addSubview(myDatePicker)
        
        // baseViewにボタンを配置（右上）
        // self.view.frame.width 今動いているデバイスと同じ横幅
        closeDButton.frame.origin.x = self.view.frame.width - 60
        closeDButton.frame.origin.y = 5
        closeDButton.frame.size.width = 50
        closeDButton.frame.size.height = 20
        
        // ボタンにタイトルを設定
        closeDButton.setTitle("Close", for: .normal)
        
        closeDButton.addTarget(self, action: #selector(closeKeyboard(_:)), for: .touchUpInside)
        baseView.addSubview(closeDButton)
        
        // baseViewを下にピッタリ配置、動作しているデバイスと横幅を同じする
        baseView.frame.origin = CGPoint(x:0,y:self.view.frame.size.height)
        baseView.frame.size = CGSize(width: self.view.frame.width, height: 250)
        
        // baseViewの背景色を設定
        baseView.backgroundColor = #colorLiteral(red: 0.877338469, green: 0.877338469, blue: 0.877338469, alpha: 1)
        
        // baseViewをViewに追加
        self.view.addSubview(baseView)
        
        //アクセサリビュー用のViewを作成
        let upView = UIView()
        upView.frame.size.height = 60
        upView.backgroundColor = UIColor.lightGray
        
        //閉じるボタンを作成
        // self.view.bounds.size.width : 今実行されてるデバイスの横幅
        let closeButton = UIButton(frame: CGRect(x: self.view.bounds.size.width - 70, y: 0, width: 70, height: 50))
        closeButton.setTitle("閉じる", for: .normal)
        //タップされたらcloseKeyboardを呼び出す
        closeButton.addTarget(self, action: #selector(closeKeyboard(_:)), for: .touchUpInside)
        
        //ビューに閉じるボタンを追加
        upView.addSubview(closeButton)
        
        //タイトルを編集するためのキーボードのアクセサリービューに設定する
        myTitle.inputAccessoryView = upView
        
    }
    
    //入力開始　textfieldクラスの関数
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        print("textFieldShouldBeginEditing")
        print(textField.tag)
        
        switch textField.tag {
        case 1:
            //タイトル
            return true
        case 2:
            
            if flag{
                UIView.animate(withDuration: 0.3) { () -> Void in
                    self.baseView.frame.origin = CGPoint(x:0,y:self.view.frame.size.height)
                }
                flag = false
            }else{
                //日付
                UIView.animate(withDuration: 0.3) { () -> Void in
                    self.baseView.frame.origin = CGPoint(x:0,y:self.view.frame.size.height - 250)
                }
                flag = true
            }
            
            return false
            
        default:
            return true
        }
    }
    
    //あしたやる
//    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool{
//        
//    }
    
    //キーボードを閉じる関数
    func closeKeyboard(_ sender: UIButton){
        
        UIView.animate(withDuration: 0.3) { () -> Void in
            self.baseView.frame.origin.y = self.view.frame.size.height
        }

        
        //タイトルの編集で表示されたキーボードを閉じる
        myTitle.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

