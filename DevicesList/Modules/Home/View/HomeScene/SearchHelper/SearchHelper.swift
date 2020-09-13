//
//  SearchHelper.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/11/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import UIKit

class SearchHelper : NSObject{
    
    var delegate :SearchHelperDelegate!
    var searchBar :UISearchBar!
    override init() {
        super.init()
    }
    
    convenience init(
        searchBar: UISearchBar
        ,delegate:SearchHelperDelegate
    ) {
        self.init()
        self.delegate = delegate
        self.searchBar = searchBar
    }
    
}

extension SearchHelper {
    
    func setup() {
        
        self.searchBar.delegate = self
        let image:UIImage = #imageLiteral(resourceName: "search")
        searchBar.textField?.subviews.first?.isHidden = true
        searchBar.textField?.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        searchBar.textField?.placeholder = "Search"
        searchBar.textField?.setRightImage(rightImage: image, rightPadding: 10, leftPadding: 10)
        searchBar.textField?.layer.backgroundColor = Colors.background.color.cgColor
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "Cancel"
        searchBar.tintColor = .darkGray
        searchBar.textField?.layer.cornerRadius = 15
        searchBar.textField?.layer.borderWidth = 1
        searchBar.textField?.layer.borderColor = UIColor.lightGray.cgColor
        searchBar.textField?.layer.masksToBounds = true
        
    }
}

extension SearchHelper : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(
        _ searchBar: UISearchBar
    ) {
        DispatchQueue.main.async(execute: {
            if let text = searchBar.text {
                self.delegate.search(with: text)
            }
        })
    }
    
    func searchBarTextDidBeginEditing(
        _ searchBar: UISearchBar
    ) {
        DispatchQueue.main.async(execute: {
            self.searchBar.showsCancelButton = true
        })
    }

    func searchBarTextDidEndEditing(
        _ searchBar: UISearchBar
    ) {
        searchBar.showsCancelButton = false
        self.delegate.searchBarDidDismissed()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.main.async(execute: {
            self.searchBar.text = ""
            self.delegate.searchBarDidDismissed()
        })
    }

}
