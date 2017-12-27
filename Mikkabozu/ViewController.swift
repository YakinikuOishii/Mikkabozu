//
//  ViewController.swift
//  Mikkabozu
//
//  Created by 笠原未来 on 2017/12/17.
//  Copyright © 2017年 笠原未来. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    
    @IBOutlet var table: UITableView! = UITableView()
    
    var saveToDo = UserDefaults.standard
    
//    @IBOutlet var button: UIButton!
    
//    @IBOutlet var textField: UITextField! = UITextField()
    
//    var pickerView: UIPickerView! = UIPickerView()
//    let day = ["1日","2日","3日","4日","5日","6日","7日"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didsSelectRowAt indexPath: IndexPath) {
        print("セルは\(indexPath.row)番")
    }
    
    // ID付きのセルを取得
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        // func
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

