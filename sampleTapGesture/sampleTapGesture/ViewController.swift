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
        let alert = UIAlertController(title: "gesture", message: "tap", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style:  .default, handler: nil))
        present(alert,animated: true,completion: nil)
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        let alert = UIAlertController(title: "gesture", message: "swipe right", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style:  .default, handler: nil))
        present(alert,animated: true,completion: nil)
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        let alert = UIAlertController(title: "gesture", message: "swipe left", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style:  .default, handler: nil))
        present(alert,animated: true,completion: nil)
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

