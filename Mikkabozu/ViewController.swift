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
    
    var indexArray:[Int] = []
    var toDoArray:[String] = []
    var dayArray:[String] = []
    
    var index: Int!
    
    var saveIndex = UserDefaults.standard
    var saveToDo = UserDefaults.standard
    var saveDay = UserDefaults.standard
    
//    @IBOutlet var button: UIButton!
    
//    @IBOutlet var textField: UITextField! = UITextField()
    
//    var pickerView: UIPickerView! = UIPickerView()
//    let day = ["1日","2日","3日","4日","5日","6日","7日"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        indexArray = saveIndex.object(forKey: "index") as! [Int]
        toDoArray = saveToDo.object(forKey: "todo") as! [String]
        dayArray = saveDay.object(forKey: "day") as! [String]
        
        print(indexArray, toDoArray, dayArray)

        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // ID付きのセルを取得
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        index = indexArray.index(of: indexPath.row)
        
        let toDoLabel = cell?.viewWithTag(1) as! UILabel
        if index != nil {
            toDoLabel.text = toDoArray[index]
        }else{
            
        }
        
        let dayLabel = cell?.viewWithTag(2) as! UILabel
        if index != nil {
            dayLabel.text = dayArray[index]
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexArray.append(indexPath.row)
        saveIndex.set(indexArray, forKey: "index")
        print("\(indexPath.row)番のセル")
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

