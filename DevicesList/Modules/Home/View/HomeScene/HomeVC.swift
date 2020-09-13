//
//  HomeVC.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/8/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet {
            setupFilterColletionView()
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            setupContentTableView()
        }
    }
    //MARK:- Properties
    private var isSearchBarSetuped = false
    
    private lazy var chipCellDataSrc: FilterDataSrc! = {
        let src = FilterDataSrc()
        src.items = presenter.getFilters()
        src.onItemSelected = { [weak self] indexPath in
            guard let self = self else {
                return
            }
            self.presenter.setFilter(filter:self.presenter.getFilters()[indexPath.row].name)
        }
        return src
    }()
    
    private lazy var contentsDataSrc: ContentsDataSource! = {
        let src = ContentsDataSource()
        return src
    }()
    
    private lazy var presenter:HomeVCPresenter! = {
        let presenter = HomeVCPresenter(view:self)
        return presenter
    }()
    
    private lazy var searchHelper:SearchHelper! = {
        let searchHelper = SearchHelper(
            searchBar: self.searchBar
            , delegate: self
        )
        return searchHelper
    }()
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard !isSearchBarSetuped else {
            return
        }
        isSearchBarSetuped = true
        self.searchHelper.setup()
    }
    
}

extension HomeVC {
    
    func setupFilterColletionView() {
        collectionView.register(FilterChipCell.self, forCellWithReuseIdentifier:"FilterChipCell")
        collectionView.dataSource = chipCellDataSrc
        collectionView.delegate = chipCellDataSrc
        collectionView.allowsMultipleSelection = false
    }
    
    func setupContentTableView() {
        tableView.register(cell: ContentItemCell.self)
        tableView.dataSource = contentsDataSrc
        tableView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    }
}


extension HomeVC : ContentsView {
    
    func isLoading(_ isLoading: Bool) {
        self.loadActivity(isLoading)
    }
    
    func updatefetchedData() {
        self.contentsDataSrc.items = presenter.getContents()
        tableView.reloadData()
    }
    
    func didFinishedWithError(msg: String) {
        NotifiyMessage.shared.toast(toastMessage: msg)
    }
    
}

extension HomeVC: SearchHelperDelegate {
    
    func search(with searchTerm: String) {
        presenter.toggleSearch(isSearching: true)
        presenter.search(searchTerm: searchTerm)
    }
    
    func searchBarDidDismissed() {
        presenter.toggleSearch(isSearching: false)
        DispatchQueue.main.async(execute: {
            self.view.endEditing(true)
        })
    }
}
