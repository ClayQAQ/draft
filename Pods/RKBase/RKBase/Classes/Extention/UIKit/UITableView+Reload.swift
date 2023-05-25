//
//  UITableView-Reload.swift
//  rokid
//
//  Created by lamo on 2017/7/6.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

extension UITableView {
    
    public func reload(section: Int, with animation: UITableView.RowAnimation = .none) {
        var indexSet = IndexSet()
        indexSet.insert(section)
        self.reloadSections(indexSet, with: animation)
    }
    
    public func reload(sections: [Int], with animation: UITableView.RowAnimation = .none) {
        var indexSet = IndexSet()
        sections.forEach { indexSet.insert($0) }
        self.reloadSections(indexSet, with: animation)
    }
}

extension UICollectionView {
    
   public func reload(section: Int) {
        var indexSet = IndexSet()
        indexSet.insert(section)
        self.reloadSections(indexSet)
    }
    
   public func reload(sections: [Int]) {
        var indexSet = IndexSet()
        sections.forEach { indexSet.insert($0) }
        self.reloadSections(indexSet)
    }
    
}
