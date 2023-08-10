//
//  CountriesView.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import UIKit

class CountriesView: UIView {
    // MARK: - Properties
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.barStyle = .default
        searchBar.placeholder = "Search for a country"
        searchBar.backgroundColor = .systemGray6
        searchBar.returnKeyType = .search
        return searchBar
    }()
    
    lazy var listCountriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(ListCountriesTableViewCell.self, forCellReuseIdentifier: ListCountriesTableViewCell.identifier)
        tableView.backgroundColor = .white
        return tableView
    }()
    
    // MARK: - initializers
    init(tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource, searchBarDelegate: UISearchBarDelegate) {
        super.init(frame: .zero)
        self.listCountriesTableView.delegate = tableViewDelegate
        self.listCountriesTableView.dataSource = tableViewDataSource
        self.searchBar.delegate = searchBarDelegate
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        addSubviews()
        setupContraints()
    }
    
    private func addSubviews() {
        addSubview(searchBar)
        addSubview(listCountriesTableView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            searchBar.heightAnchor.constraint(equalToConstant: 60),
            
            listCountriesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            listCountriesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            listCountriesTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            listCountriesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
