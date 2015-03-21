//
//  DeviceViewController.swift
//  MezamasiMegane
//
//  Created by masai on 2015/03/21.
//  Copyright (c) 2015年 masai. All rights reserved.
//

import UIKit

class DeviceViewController: UITableViewController, MAFunikiManagerDelegate {
    let funikiManager = MAFunikiManager.sharedInstance()    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // タイトルを設定
        self.title = "メガネを選択"
    }
    
    override func viewWillAppear(animated: Bool) {
        
        funikiManager.delegate = self
        
        // 雰囲気メガネデバイスを探す
        funikiManager.startSelectingDevice()
        
        // テーブルの更新
        self.tableView.reloadData()
        
        super.viewWillAppear(animated)

    }
    
    // 画面の自動回転
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    // 雰囲気メガネデバイスの検索 delegate
    func funikiManager(manager: MAFunikiManager!, didUpdateDiscoverdPeripherals peripherals: [AnyObject]!) {

        self.tableView.reloadData()
    }
    
    // UITableViewController delegate
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return funikiManager.discoverdPeripherals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("devicecell") as UITableViewCell
        
        let discoveredPeripheral = funikiManager.discoverdPeripherals[indexPath.row] as MADiscoveredPeripheral
        cell.textLabel?.text = discoveredPeripheral.peripheral.name
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let discoveredPeripheral = funikiManager.discoverdPeripherals[indexPath.row] as MADiscoveredPeripheral
        funikiManager.connectPeripheral(discoveredPeripheral)
        funikiManager.stopSelectingDevice()
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    
    @IBAction func cancel(sender:AnyObject!) {
        funikiManager.stopSelectingDevice()
        
        // 画面遷移
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
