//
//  CountriesView.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import UIKit

class CountriesView: UIView {
    // MARK: - Properties
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Countries List"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.clipsToBounds = true
        searchBar.layer.cornerRadius = 10
        searchBar.placeholder = "Search for a country"
        searchBar.backgroundColor = .white
        searchBar.returnKeyType = .search
        return searchBar
    }()
    
    lazy var listCountriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.register(ListCountriesTableViewCell.self, forCellReuseIdentifier: ListCountriesTableViewCell.identifier)
        tableView.backgroundColor = .white
        tableView.separatorInset = .zero
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
        addSubview(titleLabel)
        addSubview(searchBar)
        addSubview(listCountriesTableView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 60),
            
            listCountriesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            listCountriesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            listCountriesTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            listCountriesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
