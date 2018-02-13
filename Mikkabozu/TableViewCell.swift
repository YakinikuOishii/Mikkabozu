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
    
    @IBAction func done() {
        var date = Date()
        print("今日は\(date)")
    }
    
    // 今日の日付をString型で取得
    func getToday(format:String = "yyyyMMdd") -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: now as Date)
    }
}
