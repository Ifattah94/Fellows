//
//  FellowView.swift
//  Fellows
//
//  Created by C4Q on 1/5/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class FellowView: UIView {
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(FellowsCell.self, forCellReuseIdentifier: "FellowCell")
        tv.backgroundColor = .orange
        return tv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
        
    }
    
    
    
    private func setupViews() {
        setUpTableView()
    }
    private func setUpTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true 
        NSLayoutConstraint.activate(tableView.constraints)
        
    }
    
   
    
    
    
}


