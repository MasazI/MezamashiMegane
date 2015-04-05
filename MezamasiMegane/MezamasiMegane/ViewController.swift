//
//  ViewController.swift
//  MezamasiMegane
//
//  Created by masai on 2015/03/19.
//  Copyright (c) 2015年 masai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MAFunikiManagerDelegate, MAFunikiManagerDataDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    let funikiManager = MAFunikiManager.sharedInstance()
    
    @IBOutlet weak var statusLabal: UILabel!
    
    @IBOutlet weak var hourPicker: UIPickerView!
    
    // hourdata
    var data: [[String]] = [["0", "1", "2", "3", "4", "5", "6", "7"]]
    
    // selected minites data
    var time: String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hourPicker.delegate = self
        hourPicker.dataSource = self
    }
    
    
    override func viewWillAppear(animated: Bool) {
        // 受信delegate
        funikiManager.delegate = self
        
        // データ受信delegate
        funikiManager.dataDelegate = self
        
        // 接続状態を更新
        updateConnectStatus()
        
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateConnectStatus(){
        if funikiManager.connected {
            self.statusLabal.text = "接続済"
        } else {
            self.statusLabal.text = "未接続"
        }
    }

    /* MAFunikiManagerDelegate */
    func funikiManagerDidConnect(manager: MAFunikiManager!) {
        updateConnectStatus()
    }
    
    func funikiManagerDidDisconnect(manager: MAFunikiManager!, error: NSError!) {
        updateConnectStatus()
    }
    
    
    
    /* MAFunikiManagerDataDelegate */
    
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
        
        // データの更新
        self.time = data[component][row] as String
    }
    
    /* segue for [TimerViewController, (増えたらここへ追加)] */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segue") {
            // TimerViewControllerクラスをインスタンス化してsegue（画面遷移）で値を渡せるようにバンドルする
            var timerView : TimerViewController = segue.destinationViewController as TimerViewController
            // timerView（バンドルされた変数）に受け取り用の変数を引数としtimeを渡す（timeには渡したい値を代入しておく）
            // この時TimerViewControllerにて受け取る同型の変数を用意しておかないと例外発生
            timerView.timeTime = self.time
        }
    }

}

