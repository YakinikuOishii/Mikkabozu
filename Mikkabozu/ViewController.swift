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
    var expectedDaysArray:[Int] = []
    
    var indexOf: Int!
    var index: Int!
    var arrayCount: Int!
    
    var saveIndex = UserDefaults.standard
    var saveToDo = UserDefaults.standard
    var saveDay = UserDefaults.standard
    var saveIndexOf = UserDefaults.standard
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
//    @IBOutlet var button: UIButton!
//    var date: Date!
    var saveDate = UserDefaults.standard
    
//    @IBOutlet var textField: UITextField! = UITextField()
    
//    var pickerView: UIPickerView! = UIPickerView()
//    let day = ["1日","2日","3日","4日","5日","6日","7日"]

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.titleView = UIImageView(image:UIImage(named: ))
        table.dataSource = self
        table.delegate = self
        
        if saveIndex.object(forKey: "index") != nil {
            indexArray = saveIndex.object(forKey: "index") as! [Int]
            toDoArray = saveToDo.object(forKey: "todo") as! [String]
            expectedDaysArray = saveDay.object(forKey: "day") as! [Int]
        }else{
            print("viewdidユーザーデフォルツは空です")
        }
        
        
//        print("viewdid\(indexArray, toDoArray, dayArray)")

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addCell() {
        // 配列の中身をここでも受け渡さなければならないけど、戻るボタンを押した時のために配列の追加は遷移先で行わなければならない
        arrayCount = indexArray.count
//        indexArray.append(indexArray.count)
        saveIndex.set(arrayCount, forKey: "count")
        saveIndex.set(indexArray, forKey: "index")
        self.performSegue(withIdentifier: "toAddCellViewController", sender: (Any).self)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return indexArray.count
    }
    
    // ID付きのセルを取得
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell!
        print("\(indexPath.row)番のセルを取得")
        
        indexOf = indexArray.index(of: indexPath.row)
        let toDoLabel = cell?.viewWithTag(1) as! UILabel
        
        if indexOf != nil {
            toDoLabel.text = toDoArray[indexOf]
        }else{
            print("indexOfは空です")
        }
        
        let dayLabel = cell?.viewWithTag(2) as! UILabel
        if indexOf != nil {
            dayLabel.text = "3"
            if appDelegate.getDayArray.count >= 3 {
                dayLabel.text = "7"
                if appDelegate.getDayArray.count >= 7 && expectedDaysArray[indexOf] >= 7{
                    dayLabel.text = "14"
                    if appDelegate.getDayArray.count >= 14 && expectedDaysArray[indexOf] >= 14{
                        dayLabel.text = "30"
                        if appDelegate.getDayArray.count >= 30 && expectedDaysArray[indexOf] >= 30{
                            dayLabel.text = "90"
                            if appDelegate.getDayArray.count >= 90 && expectedDaysArray[indexOf] >= 90{
                                dayLabel.text = "180"
                            }
                        }
                    }
                }
            }
        }else{
            print("indexOfは空です")
        }
        
        return cell!
    }
    
    //セルをタップした時のメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("セルがタップされたよ")
        performSegue(withIdentifier: "toCalendar", sender: Any.self)
    }
    
    
    // Cellのスワイプメソッドを実装
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteCellButton = UITableViewRowAction(style: .default, title: " 削除　") { action, index in
            self.deleteCell(content: "削除", index: index.row) // 押されたときの動きを定義
        }
//        let editCellButton = UITableViewRowAction(style: .default, title: "編集") { action, index in
//            self.editCell(content: "編集", index: index.row)
//        }
    
        // 背景色
        deleteCellButton.backgroundColor = UIColor(red: 200.0/255.0, green:0/255.0, blue:78/255.0, alpha: 1.0)
//        editCellButton.backgroundColor = UIColor(red: 0.0/255.0, green:166/255.0, blue:195/255.0, alpha: 1.0)


        return [deleteCellButton]
    }

    // trueを返すことでCellのアクションを許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func deleteCell(content: String, index: Int) {
        table.reloadData()
        print("delete:\(index)")
        print (indexArray)
        indexOf = indexArray.index(of: index)
        print("deleteOf\(indexOf)")
        indexArray.removeLast()
        expectedDaysArray.remove(at: indexOf)
        toDoArray.remove(at: indexOf)
        table.reloadData()
        print("delete\(indexArray,expectedDaysArray,toDoArray)")

        saveIndex.set(indexArray, forKey: "index")
        saveDay.set(expectedDaysArray, forKey: "day")
        saveToDo.set(toDoArray, forKey: "todo")
    }
//
//    func editCell(content: String, index: Int) {
//
//    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

