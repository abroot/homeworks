//
//  ViewController.swift
//  sampleActionSheet
//
//  Created by 福田隆史 on 2017/09/04.
//  Copyright © 2017年 f.R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var goLabel: UILabel!
    
    @IBAction func goButton(_ sender: UIButton) {
        
        //アクションシートを作成
        let actionSheet = UIAlertController(title: "アクティビティ", message: "なんする？", preferredStyle: .actionSheet)
        
        //アクティビティボタン１を追加
        actionSheet.addAction(UIAlertAction(title: "ヨガ", style: .default, handler: {action in self.Activity(name: "ヨガ")}))
        
        //アクティビティボタン２を追加
        actionSheet.addAction(UIAlertAction(title: "バスケ", style: .default, handler: {action in self.Activity(name: "バスケ")}))
        
        //削除ボタンを追加
        actionSheet.addAction(UIAlertAction(title: "ムエタイ", style: .destructive, handler: {action in self.Fight(name: "ムエタイ")}))
        
        //キャンセルボタンを追加
        actionSheet.addAction(UIAlertAction(title: "今日はやめとく", style: .cancel, handler: {action in self.noAction()}))
        
        //アクションシートを表示
        present(actionSheet,animated: true,completion: nil)
        
        
    }
    
    func Activity(name:String){
        goLabel.text = "\(name)、行こう！"
    }
    
    //TODO:削除ボタンが押された時に呼ばれる関数
    func Fight(name:String){
        goLabel.text = "\(name)で強くなる！"
    }
    
    //TODO:キャンセルボタンが押された時に呼ばれる関数
    func noAction(){
        goLabel.text = "明日はなにかしたい..."
    }
    
    //TODO:作った関数を呼び出すようにしたら、GIThubにPush

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

