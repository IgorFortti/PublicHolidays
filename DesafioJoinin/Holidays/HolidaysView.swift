//
//  HolidaysView.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import UIKit

class HolidaysView: UIView {
    // MARK: - Properties
    lazy var listHolidayTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(ListHolidayTableViewCell.self, forCellReuseIdentifier: ListHolidayTableViewCell.identifier)
        tableView.backgroundColor = .white
        return tableView
    }()
    
    // MARK: - Initializers
    init(tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        self.listHolidayTableView.delegate = tableViewDelegate
        self.listHolidayTableView.dataSource = tableViewDataSource
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        backgroundColor = .systemGray6
        addSubviews()
        setupContraints()
    }
    
    private func addSubviews() {
        addSubview(listHolidayTableView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            listHolidayTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            listHolidayTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            listHolidayTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            listHolidayTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
