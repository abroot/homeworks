//
//  detailView.swift
//  sampleTeaList
//
//  Created by 福田隆史 on 2017/09/07.
//  Copyright © 2017年 f.R. All rights reserved.
//

import Foundation
import UIKit

class detailView: UIViewController{
    
    var index:Int!
    var nameList:[String]!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameList[index]
        
        switch index {
        case 0:
            image.image = UIImage(named:"eren.png")
        case 1:
            image.image = UIImage(named:"mikasa.jpeg")
        case 2:
            image.image = UIImage(named:"arumin.jpg")
        case 3:
            image.image = UIImage(named:"titan.jpeg")
        default:
            break
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
