//
//  ViewController.swift
//  sampleJSON
//
//  Created by 福田隆史 on 2017/09/14.
//  Copyright © 2017年 f.R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //東京電力のAPIからデータ取得 plistの設定変更も必要（済）
        //urlを指定してネット経由で取得
        var url = URL(string: "http://tepco-usage-api.appspot.com/2016/2/2/0.json")
        //ネットに接続するためのリクエストを作成
        var request = URLRequest(url: url!)
        //jsonデータをdata型で取得
        var jsondata01 = (try! NSURLConnection.sendSynchronousRequest(request, returning: nil))
        //辞書データに変換
        let dic = (try! JSONSerialization.jsonObject(with: jsondata01, options: [])) as! NSDictionary
        //取得したデータ数だけ繰り返して表示
        for(key,data) in dic{
            print("\(key):\(data)")
        }
        
        
        //ローカルjsonファイル読み込む
        //ファイルパスの取得
        let filePath = Bundle.main.path(forResource: "text", ofType: "json")
        //ファイルパスを指定して、ファイルの内容を取得（data型で取得）
        let jsondata02 = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
        //配列データに変換
        let jsonArray = (try! JSONSerialization.jsonObject(with: jsondata02!, options: [])) as! NSArray
        //配列の個数だけ繰り返して、デバッグエリアに表示
        for dat in jsonArray{
            print("取得できた値「\(dat)」")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

