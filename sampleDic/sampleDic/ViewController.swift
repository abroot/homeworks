//
//  ViewController.swift
//  sampleDic
//
//  Created by 福田隆史 on 2017/10/04.
//  Copyright © 2017年 f.R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myDictionary = [Int: Dictionary<Int, Int>]() //Anyも可
    var food: [String: String] = ["apple": "りんご", "banana": "バナナ"]
    
    var dic = [[Dictionary<String,Dictionary<String,Any>>]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "testList", ofType: "plist")
        dic = NSArray(contentsOfFile: path!) as! [[Dictionary<String,Dictionary<String,Any>>]]
        
        var subDic :[String:Any] = dic[0][0]["初年次セミナー1"]!
        
        subDic["bool"] = true
        let bl = subDic["bool"] as! Bool
        
        if bl {
            print("aaa")
        }
        
        for (key, value) in subDic {
            print("\(key): \(value)")
        }
        
        

        
//        food["orange"] = "オレンジ"
//        myDictionary[0] = [0:0,1:0]
//        myDictionary[1] = [1:1]
//        myDictionary[0]?[2] = 1
//        
//        
//        if myDictionary.isEmpty {
//            print("から")
//        }else{
//            for (key, value) in myDictionary {
//                print("\(key): \(value)")
//            }
//            for (key, value) in food {
//                print("\(key): \(value)")
//            }
//            
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

