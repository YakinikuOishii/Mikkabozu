//
//  CalenderViewController.swift
//  Mikkabozu
//
//  Created by 笠原未来 on 2018/01/09.
//  Copyright © 2018年 笠原未来. All rights reserved.
//

import UIKit

class CalenderViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource{
    
    var collectionView: UICollectionView!
    let dateManager = DateManager()
    
    var weekArray = ["日","月","火","水","木","金","土"]

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

    
    // セクションの数
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // セクション内のセルの個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //セクション毎にセルの総数を変える
        switch (section) {
        case 0:
            return 7
            
        case 1:
            return self.dateManager
        default:
            print("error")
            return 0
        }
    }
    
    // セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // カレンダー.スウィフトファイルを作ってから
        let cell: UICollectionViewCell
        
        // セクションごとにセルのプロパティを変える
        switch (indexPath.section) {
        case 0:
            cell.
        default:
            <#code#>
        }
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
