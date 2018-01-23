//
//  CalenderViewController.swift
//  Mikkabozu
//
//  Created by 笠原未来 on 2018/01/09.
//  Copyright © 2018年 笠原未来. All rights reserved.
//

import UIKit
extension UIView {
    
    enum BorderPosition {
        case Top
        case Right
        case Bottom
        case Left
    }
    
    func border(borderWidth: CGFloat, borderColor: UIColor?, borderRadius: CGFloat?) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
        if let _ = borderRadius {
            self.layer.cornerRadius = borderRadius!
        }
        self.layer.masksToBounds = true
    }
    
    func border(positions: [BorderPosition], borderWidth: CGFloat, borderColor: UIColor?) {
        
        let topLine = CALayer()
        let leftLine = CALayer()
        let bottomLine = CALayer()
        let rightLine = CALayer()
        
        self.layer.sublayers = nil
        self.layer.masksToBounds = true
        
        if let _ = borderColor {
            topLine.backgroundColor = borderColor!.cgColor
            leftLine.backgroundColor = borderColor!.cgColor
            bottomLine.backgroundColor = borderColor!.cgColor
            rightLine.backgroundColor = borderColor!.cgColor
        } else {
            topLine.backgroundColor = UIColor.white.cgColor
            leftLine.backgroundColor = UIColor.white.cgColor
            bottomLine.backgroundColor = UIColor.white.cgColor
            rightLine.backgroundColor = UIColor.white.cgColor
        }
        
        if positions.contains(.Top) {
            topLine.frame = CGRect(x:0.0, y:0.0, width:self.frame.width, height:borderWidth)
            self.layer.addSublayer(topLine)
        }
        if positions.contains(.Left) {
            leftLine.frame = CGRect(x:0.0,y: 0.0, width:borderWidth,height: self.frame.height)
            self.layer.addSublayer(leftLine)
        }
        if positions.contains(.Bottom) {
            bottomLine.frame = CGRect(x:0.0,y: self.frame.height - borderWidth, width:self.frame.width, height:borderWidth)
            self.layer.addSublayer(bottomLine)
        }
        if positions.contains(.Right) {
            rightLine.frame = CGRect(x:self.frame.width - borderWidth, y:0.0,width: borderWidth, height:self.frame.height)
            self.layer.addSublayer(rightLine)
        }
        
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let _ = self.layer.borderColor {
                return UIColor(cgColor: self.layer.borderColor!)
            }
            return nil
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}
class CalenderViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @ IBOutlet var collectionView: UICollectionView!
    
    // インスタンス化する！
    let dateManager = DateManager()
    var startDate = Date()
    
    var weekArray = ["日","月","火","水","木","金","土"]
    var monthLabel:UILabel!
    var weekLabel:UILabel!
    
    var numOfDays: Int! = 7
    let cellMargin: CGFloat! = 2.0 // セルの余白 セルアイテムとは別

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let width = view.frame.width
        let height = view.frame.height

        let month:Int = Int(dateManager.monthTag(row:6,startDate:startDate))!
        let digit = numberOfDigit(month: month)
        
        var components = NSCalendar.current.dateComponents([.year ,.month, .day], from:startDate)
        components.day = 1
        components.month = 1
        components.year = 2017
        startDate = NSCalendar.current.date(from: components)!
        
        monthLabel = UILabel()
        monthLabel.frame = CGRect(x:0,y:0,width:width,height:50)
        monthLabel.center = CGPoint(x:width / 2,y:25)
        monthLabel.backgroundColor = UIColor.white
        monthLabel.textAlignment = .center
        
        if digit == 5 {
            monthLabel.text = String(month / 10) + "年" + String(month % 10) + "月"
        }else if digit == 6 {
            monthLabel.text = String(month / 100) + "年" + String(month % 100) + "月"
        }
        self.view.addSubview(monthLabel)
        
        weekLabel = UILabel()
        weekLabel.frame = CGRect(x:0,y:50,width:width,height:50)
        weekLabel.center = CGPoint(x:width / 2,y:25)
        weekLabel.backgroundColor = UIColor.white
        weekLabel.textAlignment = .center
        weekLabel.text = "日 月 火 水 木 金 土"
        self.view.addSubview(weekLabel)
        
//        let date = Date()
//        var components = NSCalendar.current.dateComponents([.year ,.month, .day], from:date)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool){
        collectionView.setContentOffset(CGPoint(x:0,y:self.collectionView.contentSize.height - self.collectionView.frame.size.height), animated: false)
    }
    
    // セクション数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // データの個数(データソースを設定した場合に必要な項目)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return dateManager.cellCount(startDate: startDate) // section1は曜日を表示
        
    }
    
    // データを返すメソッド セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // セルの取得
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        
//        if indexPath.section == 0 { // 曜日表示
//            cell.backgroundColor = UIColor.gray
//            cell.textLabel.textColor = UIColor.blue
//            cell.textLabel.text = weekArray[indexPath.row]
//        }else if indexPath.section == 1{
            cell.backgroundColor = UIColor.white
            // セルの日付を取得
            cell.textLabel.text = dateManager.conversionDateFormat(row:indexPath.row,startDate:startDate)
            if indexPath.row % 7 == 0 {
                cell.textLabel.textColor = UIColor.red
            }else if indexPath.row % 7 == 6 {
                cell.textLabel.textColor = UIColor.blue
            }else if indexPath.row % 7 == 1 || indexPath.row % 7 == 2 || indexPath.row % 7 == 3 || indexPath.row % 7 == 4 || indexPath.row % 7 == 5{
                cell.textLabel.textColor = UIColor.gray
            }
//        }
        
//            let day = Int(dateManager.conversionDateFormat(row:indexPath.row,startDate:startDate))!
//            if day == 1{
//                cell.textLabel.border(positions:[.Top,.Left],borderWidth:1,borderColor:UIColor.black)
//            }else if day <= 7 {
//                cell.textLabel.border(positions:[.Top],borderWidth:1,borderColor:UIColor.black)
//            }else{
//                cell.textLabel.border(positions:[.Top],borderWidth:0,borderColor:UIColor.white)
//            }
        
        let day = Int(dateManager.conversionDateFormat(row:indexPath.row,startDate:startDate))!
        if day == 1{
            cell.textLabel.border(positions:[.Top,.Left],borderWidth:1,borderColor:UIColor.black)
        }else if day <= 7 {
            cell.textLabel.border(positions:[.Top],borderWidth:1,borderColor:UIColor.black)
        }else{
            cell.textLabel.border(positions:[.Top],borderWidth:0,borderColor:UIColor.white)
        }
        // セルに年と月のタグをつける
        cell.tag = Int(dateManager.monthTag(row:indexPath.row,startDate:startDate))!
//        print(cell.tag)
        return cell
    }
    
    // セルをタップした時の処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("index:\(indexPath.row), セクション:\(indexPath.section)")
    }
    
    // セルサイズの指定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfMargin: CGFloat! = 8.0
        let widths:CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin)/CGFloat(numOfDays)
        let heights:CGFloat = widths * 0.8

//        if indexPath.section == 0 {
//            return CGSize(width: widths,height: heights)
//        }else{
            return CGSize(width: widths,height: heights * 1.5)
//        }
        
    }
    
    //セルのアイテムのマージン
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0.0 , 0.0 , 0.0 , 0.0 )  //マージン(top , left , bottom , right)
    }
    
    //セルの水平方向のマージン InteritemSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    //セルの垂直方向のマージン LineSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleCell = collectionView.visibleCells.filter{
            return collectionView.bounds.contains($0.frame)
        }

        var visibleCellTag = Array<Int>()
        if visibleCell != [] {
            visibleCellTag = visibleCell.map{$0.tag}
            //月は奇数か偶数か　割り切れるものだけを取り出す
            let even = visibleCellTag.filter{
                return $0 % 2 == 0
            }
            let odd = visibleCellTag.filter{
                return $0 % 2 != 0
            }
            //oddかevenの多い方を返す
            let month = even.count >= odd.count ? even[0] : odd[0]

            //桁数によって分岐
            let digit = numberOfDigit(month: month)
            if digit == 5 {
                monthLabel.text = String(month / 10) + "年" + String(month % 10) + "月"
            }else if digit == 6 {
                monthLabel.text = String(month / 100) + "年" + String(month % 100) + "月"
            }
            self.view.addSubview(monthLabel)
        }
    }
    
    func numberOfDigit(month:Int) -> Int{
        var num = month
        var cnt = 1
        while(num / 10 != 0){
            cnt = cnt + 1
            num = num / 10
        }
        return cnt
        
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
