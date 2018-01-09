//
//  AddCellController.swift
//  Mikkabozu
//
//  Created by 笠原未来 on 2017/12/19.
//  Copyright © 2017年 笠原未来. All rights reserved.
//

import UIKit

class AddCellViewController: UIViewController ,UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet var dayTextField: UITextField! = UITextField()
    @IBOutlet var toDotext: UITextView! = UITextView()
    
    @IBOutlet var doneButton: UIButton!
    
    var index: Int!
    var indexOf: Int!
    var arrayCount: Int!
    
    var pickerView: UIPickerView! = UIPickerView()
    let day = ["1日","2日","3日","4日","5日","6日","7日"]
    
    var indexArray:[Int] = []
    var toDoArray:[String] = []
    var dayArray:[String] = []
    
    var saveToDo = UserDefaults.standard
    var saveIndex = UserDefaults.standard
    var saveDay = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayCount = saveIndex.object(forKey: "count") as! Int!
        indexArray = saveIndex.object(forKey: "index") as! [Int]
        indexArray.append(arrayCount)
//        indexArray = saveIndex.object(forKey: "index") as! [Int]
        
        if saveToDo.object(forKey: "todo") != nil {
            toDoArray = saveToDo.object(forKey: "todo") as! [String]
            dayArray = saveDay.object(forKey: "day") as! [String]
        }else{
            print("ユーザーデフォルツは空です")
        }
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true
        
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddCellViewController.done))
        toolbar.setItems([doneItem], animated: true)
        
        
        self.dayTextField.inputView = pickerView
        self.dayTextField.inputAccessoryView = toolbar
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return day.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return day[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.dayTextField.text = day[row]
    }
    
    
    
    func done() {
        self.dayTextField.endEditing(true)
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    @IBAction func setDone() {
        
        dayArray.append(dayTextField.text!)
        toDoArray.append(toDotext.text)
        
        saveDay.set(dayArray, forKey: "day")
        saveToDo.set(toDoArray, forKey: "todo")
        saveIndex.set(indexArray, forKey: "index")
        print("完了\(indexArray)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

