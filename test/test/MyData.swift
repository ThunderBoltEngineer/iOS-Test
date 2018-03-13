//
//  MyData.swift
//  test
//
//  Created by Paradise on 2018/03/13.
//  Copyright © 2018 Paradise. All rights reserved.
//

import Foundation

class MyData {
    
    var date = ""
    var open = 0.0
    var high = 0.0
    var low = 0.0
    var close = 0.0
    var volume = 0
    var unadjustedVolume = 0
    var change = 0.0
    var changePercent = 0.0
    var vwap = 0.0
    var label = ""
    var changeOverTime = 0
    
    init() {}
    
    init(date: String, open: Double, high: Double, low: Double, close: Double, volume: Int, unadjustedVolume: Int, change: Double, changePercent: Double, vwap: Double, label: String, changeOverTime: Int) {
        self.date = date
        self.open = open
        self.high = high
        self.low = low
        self.close = close
        self.volume = volume
        self.unadjustedVolume = unadjustedVolume
        self.change = change
        self.changePercent = changePercent
        self.vwap = vwap
        self.label = label
        self.changeOverTime = changeOverTime
    }
    
}
