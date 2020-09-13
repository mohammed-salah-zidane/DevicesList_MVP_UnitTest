//
//  UICollectionView+Ex.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func register<T>(cell: T.Type) where T: UICollectionViewCell  {
        register(cell.nib, forCellWithReuseIdentifier: cell.CellIdentifier)
    }
    
    func registerCellNib<Cell: UICollectionViewCell>(cellClass: Cell.Type){
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: Cell.self))
    }
    
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell{
        let identifier = String(describing: Cell.self)
        
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Error in cell")
        }
        
        return cell
    }
    
}

extension UICollectionViewCell: IdentifiableCell {
    static var CellIdentifier: String {
        return "\(self)"
    }
}

extension UICollectionViewCell {
    var collectionView: UICollectionView? {
        return self.next(of: UICollectionView.self)
    }
    
    var indexPath: IndexPath? {
        return self.collectionView?.indexPath(for: self)
    }
}
