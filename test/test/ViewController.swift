//
//  ViewController.swift
//  test
//
//  Created by Paradise on 2018/03/13.
//  Copyright © 2018 Paradise. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var tableView = UITableView()

    // data to be displayed in tableview
    var data = [MyData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupUI()
        
        loadData()
    }
    
    private func setupUI() {
        
        // initialize and add tableview
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        tableView.register(MyCell.self, forCellReuseIdentifier: "MyCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadData() {
        // fetch data from api endpoint
        Alamofire.request(URL(string: "https://api.iextrading.com/1.0/stock/aapl/chart/1m")!, method: .get, parameters: nil)
        .validate()
            .responseJSON {
                response in
                guard response.result.isSuccess else {
                    print("Error while fetching data")
                    return
                }
                
                guard let value = response.result.value as? [[String: Any]] else {
                    print("Invalid data")
                    return
                }
                
                // add data
                for dict in value {
                    let date = dict["date"] as? String ?? ""
                    let open = dict["open"] as? Double ?? 0.0
                    let high = dict["high"] as? Double ?? 0.0
                    let low = dict["low"] as? Double ?? 0.0
                    let close = dict["close"] as? Double ?? 0.0
                    let volume = dict["volume"] as? Int ?? 0
                    let unadjustedVolume = dict["unadjustedVolume"] as? Int ?? 0
                    let change = dict["change"] as? Double ?? 0.0
                    let changePercent = dict["changePercent"] as? Double ?? 0.0
                    let vwap = dict["vwap"] as? Double ?? 0.0
                    let label = dict["label"] as? String ?? ""
                    let changeOverTime = dict["changeOverTime"] as? Int ?? 0
                    
                    self.data.append(MyData(date: date, open: open, high: high, low: low, close: close, volume: volume, unadjustedVolume: unadjustedVolume, change: change, changePercent: changePercent, vwap: vwap, label: label, changeOverTime: changeOverTime))
                }
                
                // sort in ascending order
                self.data = self.data.sorted { (leftData, rightData) in leftData.changePercent < rightData.changePercent }
                
                // reload table, show data
                self.tableView.reloadData()
                
        }
    }

}

// MARK: - TableView Delegate, Datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        
        let row = indexPath.row
        cell.initWith(data: data[row])
        
        return cell
    }
}
