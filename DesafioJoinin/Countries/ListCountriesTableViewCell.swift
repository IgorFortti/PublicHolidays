//
//  ListCountriesTableViewCell.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import UIKit

class ListCountriesTableViewCell: UITableViewCell {
    // MARK: - Properties
    static let identifier: String = String(describing: ListCountriesTableViewCell.self)
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Public Methods
    public func setupCell(data: Country) {
        selectionStyle = .none
        countryLabel.text = data.name
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        addSubviews()
        setupContraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(countryLabel)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            countryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            countryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
