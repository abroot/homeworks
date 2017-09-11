//
//  ViewController.swift
//  sampleTapGesture
//
//  Created by 福田隆史 on 2017/09/11.
//  Copyright © 2017年 f.R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func touchGesture(_ sender: UITapGestureRecognizer) {
        print("touch!!")
    }
    
    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        print("swipe!!")
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

