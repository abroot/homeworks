//
//  ViewController.swift
//  samplePushNotification
//
//  Created by 福田隆史 on 2017/09/29.
//  Copyright © 2017年 f.R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tapBtn(_ sender: UIButton) {
        
        //ローカル通知オブジェクト作成
        let notif:UILocalNotification = UILocalNotification()
        
        //タイトル設定
        notif.alertTitle = "fire"
        
        //通知メッセージ
        notif.alertBody = "卒業おめでとう"
        
        //timezoneの設定(現在iphoneに設定されているタイムゾーン)
        notif.timeZone = TimeZone.current
        
        //10秒後に通知を設定
        notif.fireDate = Date(timeIntervalSinceNow: 10)
        
        //ローカル通知オブジェクトをiphoneにセット(アプリが終了してもスケジュール通り発動する)
        UIApplication.shared.scheduleLocalNotification(notif)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

