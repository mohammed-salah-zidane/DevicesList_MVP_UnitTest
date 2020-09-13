//
//  HomeProtocols.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import Foundation

protocol ContentsView : class {
    func isLoading(_ isLoading:Bool)
    func updatefetchedData()
    func didFinishedWithError(msg:String)
}


protocol SearchHelperDelegate:class{
    func search(with searchTerm:String)
    func searchBarDidDismissed()
}
