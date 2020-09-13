//
//  ContentsDataSource.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//


import UIKit

class ContentsDataSource: NSObject {

    var items = [Content]()
    var onItemSelected: ((IndexPath) -> Void)? = nil
    var isAllSelected = true

}

extension ContentsDataSource : UITableViewDataSource{
    
    
    func tableView(
        _ tableView: UITableView
        , numberOfRowsInSection section: Int
    ) -> Int {
        return items.count
    }
    
    func tableView(
        _ tableView: UITableView
        , cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let cell = tableView.dequeue() as ContentItemCell
        
        cell.setup(content: items[indexPath.row])
        
        return cell
    }
}
