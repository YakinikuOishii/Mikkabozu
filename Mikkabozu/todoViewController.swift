//
//  todoViewController.swift
//  Mikkabozu
//
//  Created by 笠原未来 on 2017/12/19.
//  Copyright © 2017年 笠原未来. All rights reserved.
//

import UIKit

class todoViewController: UIViewController ,UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet var textField: UITextField! = UITextField()
    
    var pickerView: UIPickerView! = UIPickerView()
    let day = ["1日","2日","3日","4日","5日","6日","7日"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true
        
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(todoViewController.done))
        toolbar.setItems([doneItem], animated: true)
        
        
        self.textField.inputView = pickerView
        self.textField.inputAccessoryView = toolbar

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
        self.textField.text = day[row]
    }
    
    
    
    func done() {
        self.textField.endEditing(true)
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
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
