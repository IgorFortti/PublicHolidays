//
//  listHolidayTableViewCell.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import UIKit

class ListHolidayTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: ListHolidayTableViewCell.self)
    
    lazy var holidayLabel: UILabel = {
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
    
    public func setupCell(data: Holiday) {
        holidayLabel.text = data.name
    }
    
    private func setupUI() {
        addSubviews()
        setupContraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(holidayLabel)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            holidayLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            holidayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
}
