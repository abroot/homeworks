//
//  SecondViewController.swift
//  sampleTabbar
//
//  Created by 福田隆史 on 2017/09/08.
//  Copyright © 2017年 f.R. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var indexNum: UILabel!
    
    
    //画面が表示されるたび毎回発動
    override func viewWillAppear(_ animated: Bool) {
        
        //appdelegateにアクセス
        let myApp = UIApplication.shared.delegate as! AppDelegate
        myApp.myCount += 1
        indexNum.text = "\(myApp.myCount)"
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

