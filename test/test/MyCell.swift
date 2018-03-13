//
//  MyCell.swift
//  test
//
//  Created by Paradise on 2018/03/13.
//  Copyright © 2018 Paradise. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    // custom defined background color
    let customBackgroundColor = UIColor.lightGray

    // data
    var data = MyData()
    
    let label = UILabel()
    let changePercent = UILabel()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // set these values false to add dynamic constraints
        label.translatesAutoresizingMaskIntoConstraints = false
        changePercent.translatesAutoresizingMaskIntoConstraints = false
        
        // add to cell content view
        contentView.addSubview(label)
        contentView.addSubview(changePercent)
        
        // fix two labels to left & right side of content view
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0.0).isActive = true
        
        changePercent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0).isActive = true
        changePercent.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0.0).isActive = true
        
        // set custom background color
        backgroundColor = customBackgroundColor
        
        // remove selection style
        selectionStyle = .none
    }
    
    
    public func initWith(data: MyData) {
        self.data = data
        
        label.text = data.label
        changePercent.text = String(data.changePercent)
    }
    

}
