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
    
    
    required init?(coder aDecoder: NSCoder) { //何なのかよく分かってないから後で調べる
        super.init(coder: aDecoder)!
    }
    
    @IBAction func done() {
        var date = Date()
        print("今日は\(date)")
    }
    
    
}
