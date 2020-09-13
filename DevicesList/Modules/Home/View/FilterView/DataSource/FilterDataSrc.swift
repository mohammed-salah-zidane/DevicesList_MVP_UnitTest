//
// Created by Apple on 04/09/2020.
// Copyright (c) 2020 Usman Shahid. All rights reserved.
//

import Foundation
import UIKit

class FilterDataSrc: NSObject {
    var items = [FilterItem]()
    var onItemSelected: ((IndexPath) -> Void)? = nil
    var isAllSelected = true
}

extension FilterDataSrc: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterChipCell", for: indexPath) as! FilterChipCell
        let item = items[indexPath.row]
        cell.setup(item: item)
        if isAllSelected {
            cell.isSelected = true
            isAllSelected = false
        }
        return cell
    }
}

extension FilterDataSrc: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onItemSelected?(indexPath)
        if indexPath.row != 0 {
            let cell = collectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as! FilterChipCell
            cell.isSelected = false
        }
    }
}

struct FilterItem {
    var name = ""
    var icon :UIImage?
}
