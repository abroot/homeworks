//
//  ViewController.swift
//  sampleCoreData
//
//  Created by Eriko Ichinohe on 2017/09/18.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        read()
    }
    
    //coredata データ読み込み
    func read(){
        
        let appD:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appD.persistentContainer.viewContext
        
        let query:NSFetchRequest<ToDo> = ToDo.fetchRequest() //どこから取得するのか設定
        
        do{
            let fetchResults = try viewContext.fetch(query)
            
            for result:AnyObject in fetchResults {
                let title:String? = result.value(forKey: "title") as? String
                let saveDate:Date? = result.value(forKey:"saveDate") as? Date
                
                print("title:\(title) saveDate:\(saveDate)")
            }
        }catch{
            
        }
    }

    //リターンキーが押された時（キーボードを閉じる）
    @IBAction func tapReturn(_ sender: UITextField) {
    
    }
    
    //追加ボタンが押された時（CREATEに当たる処理）
    @IBAction func tapSave(_ sender: UIButton) {
    
        //AppDelegateを使う用意をしておく
        let appD:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //エンティティを操作するためのオブジェクトを作成
        let viewContext = appD.persistentContainer.viewContext
        
        //ToDoエンティティオブジェクトを作成
        let ToDo = NSEntityDescription.entity(forEntityName: "ToDo", in: viewContext)
        
        //ToDoエンティティにレコード（行）を挿入するためのオブジェクトを作成
        let newRecord = NSManagedObject(entity: ToDo!, insertInto: viewContext)
        
        //値のセット(アトリビュート毎に指定) forKeyはモデルで指定したアトリビュート名
        //Date()は、現在日時を取得する関数
        newRecord.setValue(txtTitle.text, forKey: "title")
        newRecord.setValue(Date(), forKey: "saveDate")
        
        //レコード（行）の即時保存
        do{
            try viewContext.save()
        }catch{
        
        }
    }
    
    //削除
    @IBAction func tapDelete(_ sender: UIButton) {
        
        let appD:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appD.persistentContainer.viewContext
        let query:NSFetchRequest<ToDo> = ToDo.fetchRequest()
        
        do{
            let fetchRequests = try viewContext.fetch(query)
            
            for result:AnyObject in fetchRequests {
                let record = result as! NSManagedObject
                viewContext.delete(record)
            }
            try viewContext.save()
            
        }catch{
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

