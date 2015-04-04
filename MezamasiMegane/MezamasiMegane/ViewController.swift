//
//  ViewController.swift
//  MezamasiMegane
//
//  Created by masai on 2015/03/19.
//  Copyright (c) 2015年 masai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MAFunikiManagerDelegate, MAFunikiManagerDataDelegate {
    
    
    let funikiManager = MAFunikiManager.sharedInstance()
    
    @IBOutlet weak var statusLabal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // データピッカー
        //var rect    = CGRectMake(0, 0, 300, 100)
        //var pickerView = OriginalUIPickerView(frame: rect)
        
        //pickerView.backgroundColor = UIColor.redColor()
        //self.view.addSubview(pickerView)
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

}

