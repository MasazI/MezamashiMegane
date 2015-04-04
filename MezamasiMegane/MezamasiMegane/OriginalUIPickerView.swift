//
//  OriginalUIPickerView.swift
//  MezamasiMegane
//
//  Created by masai on 2015/04/04.
//  Copyright (c) 2015年 masai. All rights reserved.
//

import UIKit

class OriginalUIPickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource{
    // 表示データ
    var data: [[String]] = [
        ["AAA", "SSS", "DDD", "FFF"],
        ["1", "2", "3"],
        ["A", "B", "D", "E", "F", "G"]]
    
    /* イニシャライザ */
    override init(frame: CGRect) {
//        for i in 0...23 {
//            data[0].append(String(i))
//        }
//        for i in 0...59 {
//            data[1].append(String(i))
//        }
        
        super.init(frame: frame)
        let pv = UIPickerView(frame: CGRectMake(0, 200, 300, 100))
        self.addSubview(pv)
        
        pv.center = self.center
        
        pv.delegate = self
        pv.dataSource = self
        
        // 初期値
        pv.selectRow(0, inComponent: 0, animated: true)
        pv.selectRow(0, inComponent: 1, animated: true)
        pv.selectRow(0, inComponent: 2, animated: true)
    }

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /* UIPickerViewDataSource */
    // データのセット数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return data.count
    }
    
    // 各セットのデータ数
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data[component].count
    }
    
    /* セルの値を表示 */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return data[component][row] as String
    }
    
    /* 選択された時 */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        println("selected: \(row), \(data[component][row])")
    }
}
