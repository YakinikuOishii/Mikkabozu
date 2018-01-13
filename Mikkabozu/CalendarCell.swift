//
//  CalendarCell.swift
//  Mikkabozu
//
//  Created by 笠原未来 on 2018/01/12.
//  Copyright © 2018年 笠原未来. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    var textLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // UILabelを生成
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        textLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        textLabel.textAlignment = NSTextAlignment.center
        
        // セルに追加
        self.addSubview(textLabel!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
   
    
}
