//
//  TimerViewController.swift
//  MezamasiMegane
//
//  Created by masai on 2015/04/05.
//  Copyright (c) 2015年 masai. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController{
    var timeTime: String = ""

    
    @IBOutlet weak var timer: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ラベルに受け取った遷移用の変数を渡す
        timer.text = timeTime;
    }
    
    /**
    memoryWarnig
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
