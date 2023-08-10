//
//  ListCountriesTableViewCell.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import UIKit

class ListCountriesTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: ListCountriesTableViewCell.self)
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(data: Country) {
        countryLabel.text = data.name
    }
    
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
            countryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
}
