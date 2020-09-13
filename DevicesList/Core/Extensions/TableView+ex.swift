//
//  TableView+ex.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/8/20.
//  Copyright © 2020 Zidane. All rights reserved.
//


import UIKit

protocol IdentifiableCell: class {
    static var CellIdentifier: String { get }
}

extension UITableViewCell: IdentifiableCell {
    static var CellIdentifier: String {
        return "\(self)"
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        return self.next(of: UITableView.self)
    }
    
    var indexPath: IndexPath? {
        return self.tableView?.indexPath(for: self)
    }
}

extension UITableView {
    func register<T>(cell: T.Type) where T: UITableViewCell {
        register(cell.nib, forCellReuseIdentifier: cell.CellIdentifier)
    }
    func dequeueReusableCell<T: IdentifiableCell>(with cell: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cell.CellIdentifier) as? T
    }
    func dequeue<Cell: UITableViewCell>() -> Cell{
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("Error in cell")
        }
        
        return cell
    }
}
