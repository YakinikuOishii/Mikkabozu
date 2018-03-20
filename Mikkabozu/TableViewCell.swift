//
//  TableViewCell.swift
//  Mikkabozu
//
//  Created by 笠原未来 on 2018/02/07.
//  Copyright © 2018年 笠原未来. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var button: UIButton!
    var saveGetDay = UserDefaults.standard
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//    // getdayArrayにまだ今日の日付がなかったら、ボタン有効（1日1回しか押せない) どこに書けば良い？
//    if appDelegate.getDay.index(of: getToday()) != nil{
//    button.isEnabled = true
//    }else{
//    button.isEnabled = false
//    }
    @IBAction func done() {
        print("ボタン押されたよ")
        appDelegate.getDayArray.append(getToday())
        saveGetDay.set(appDelegate.getDayArray, forKey: "getDay")
        
    }
    
    // 今日の日付をString型で取得
    func getToday(format:String = "yyyyMMdd") -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: now as Date)
    }
}
