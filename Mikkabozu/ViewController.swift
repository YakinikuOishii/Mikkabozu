//
//  ViewController.swift
//  Mikkabozu
//
//  Created by 笠原未来 on 2017/12/17.
//  Copyright © 2017年 笠原未来. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet var table: UITableView! = UITableView()
    @IBOutlet var addCellButton: UIBarButtonItem!
    
    var indexArray:[Int] = []
    var toDoArray:[String] = []
    var dayArray:[String] = []
    
    var indexOf: Int!
    var index: Int!
    var arrayCount: Int!
    
    var saveIndex = UserDefaults.standard
    var saveToDo = UserDefaults.standard
    var saveDay = UserDefaults.standard
    var saveIndexOf = UserDefaults.standard
    
//    @IBOutlet var button: UIButton!
    
//    @IBOutlet var textField: UITextField! = UITextField()
    
//    var pickerView: UIPickerView! = UIPickerView()
//    let day = ["1日","2日","3日","4日","5日","6日","7日"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        if saveIndex.object(forKey: "index") != nil {
            indexArray = saveIndex.object(forKey: "index") as! [Int]
            toDoArray = saveToDo.object(forKey: "todo") as! [String]
            dayArray = saveDay.object(forKey: "day") as! [String]
        }else{
            print("ユーザーデフォルツは空です")
        }
        
        
        print("viewdid\(indexArray, toDoArray, dayArray)")

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addCell() {
        // 配列の中身をここでも受け渡さなければならないけど、戻るボタンを押した時のために配列の追加は遷移先で行わなければならない
        arrayCount = indexArray.count
//        indexArray.append(indexArray.count)
        saveIndex.set(arrayCount, forKey: "count")
        saveIndex.set(indexArray, forKey: "index")
        print("\(toDoArray)追加")
        print("\(dayArray)追加")
        print("addCell実行")
        self.performSegue(withIdentifier: "toAddCellViewController", sender: (Any).self)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return indexArray.count
    }
    
    // ID付きのセルを取得
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        print("\(indexPath.row)番のセルが選ばれた")
        indexOf = indexArray.index(of: indexPath.row)
        let toDoLabel = cell?.viewWithTag(1) as! UILabel
        
        if indexOf != nil {
            // 編集せずにナビゲーションでバック → もう一度編集画面に遷移で落ちた
            toDoLabel.text = toDoArray[indexOf]
        }else{
            print("indexOfは空です")
        }
        
        let dayLabel = cell?.viewWithTag(2) as! UILabel
        if indexOf != nil {
            dayLabel.text = dayArray[indexOf]
        }else{
            print("indexOfは空です")
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ここでは\(indexPath.row)番のセルが選ばれた")
        indexOf = indexArray.index(of: indexPath.row)
//        if indexOf != nil {
//            indexArray.remove(at: indexOf)
//            toDoArray.remove(at: indexOf)
//            dayArray.remove(at: indexOf)
//
//        }
//        indexArray.append(indexPath.row)
        saveIndexOf.set(indexOf, forKey: "indexof")
        saveIndex.set(indexPath.row, forKey: "indexpath")
//        saveIndex.set(indexArray, forKey: "index")
//        saveToDo.set(toDoArray, forKey: "todo")
//        saveDay.set(dayArray, forKey: "day")
//        print(indexArray, toDoArray, dayArray)
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

