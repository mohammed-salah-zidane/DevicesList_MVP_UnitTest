//
//  HomeVCPresenter.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import Foundation

class HomeVCPresenter {
    
    private weak var view:ContentsView?
    private var isSearching = false
    private var contents = [Content]()
    private var filteredContents = [Content]()
    private var selectedFilter = ""
    private var filters = Constants.filters
    
    init(
        view:ContentsView
    ) {
        self.view = view
    }
}

extension HomeVCPresenter {
    
    func viewDidLoad() {
        self.fetchContents()
    }
    
    func toggleSearch(
        isSearching:Bool
    ) {
        self.isSearching = isSearching
        guard isSearching else {
            filteredContents.removeAll()
            self.view?.updatefetchedData()
            return
        }
    }
    
    func search(
        searchTerm:String
    ) {
       
        filteredContents = contents.filter({ ($0.name!.localizedCaseInsensitiveContains(searchTerm))})
    
        self.updateFetchedData()
    }
    
    func getContents()
        ->[Content] {
        contents = self.contents.sorted(by: {$0.id ?? 0 > $1.id ?? 0})
        return isSearching ? filteredContents : contents
    }
    
    func setFilter(
        filter:String
    ) {
        self.selectedFilter = filter
    }
    
    func getFilters() ->[FilterItem]{
        return Constants.filters
    }
    
    func updateFetchedData () {
        self.view?.updatefetchedData()
    }
    
    func toggleLoading(isLoading:Bool) {
        view?.isLoading(isLoading)
    }
    
    func showError(errorMsg:String) {
        self.view?.didFinishedWithError(msg: errorMsg)
    }
}

extension HomeVCPresenter : HomeInteractorInjected {
    
    func fetchContents() {
        toggleLoading(isLoading: true)
        homeInteractor.getHomeContent(
            success:{ [weak self] (contents) in
            guard let self = self else {return}
            self.toggleLoading(isLoading: false)
            self.contents = contents
            self.updateFetchedData()
        }) { (errorMsg) in
            self.showError(errorMsg: errorMsg)
        }
    }
}
