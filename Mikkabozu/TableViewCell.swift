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
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func done() {
        appDelegate.getDay = getToday()
        print("ボタン押されたよ")
    }
    
    // 今日の日付をString型で取得
    func getToday(format:String = "yyyyMMdd") -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: now as Date)
    }
}
