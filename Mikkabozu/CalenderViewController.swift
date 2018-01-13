//
//  CalenderViewController.swift
//  Mikkabozu
//
//  Created by 笠原未来 on 2018/01/09.
//  Copyright © 2018年 笠原未来. All rights reserved.
//

import UIKit

class CalenderViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @ IBOutlet var collectionView: UICollectionView!
    
    var weekArray = ["日","月","火","水","木","金","土"]
    var numOfDays: Int! = 7
    let cellMargin: CGFloat! = 2.0 // セルのマージン？

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // セクション数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // データの個数？(データソースを設定した場合に必要な項目)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (section == 0) { // section0は曜日を表示
            return numOfDays
        }else{
            return 30 // section1は曜日を表示 とりあえず30日分
        }
    }
    
    // データを返すメソッド？
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // セルの取得
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        if (indexPath.section == 0) { // 曜日表示
            cell.backgroundColor = UIColor.green
            cell.textLabel.text = weekArray[indexPath.row]
        }else{
            cell.backgroundColor = UIColor.white
            cell.textLabel.text = ""
        }
        return cell
    }
    
    // セルをタップした時の処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("選ばれたのは\(indexPath.row), セクションは\(indexPath.section)")
    }
    
//    // セルサイズの指定
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let numberOfMargin: CGFloat! = 8.0
//        let widths:CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin)/CGFloat(numOfDays)
//        let heights:CGFloat = widths * 0.8
//
//        return CGSize(width:widths,height:heights)
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
