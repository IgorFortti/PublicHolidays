//
//  listHolidaysTableViewCell.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import UIKit

class ListHolidaysTableViewCell: UITableViewCell {
    // MARK: - Properties
    static let identifier: String = String(describing: ListHolidaysTableViewCell.self)
    
    lazy var nameHolidayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var localNameHolidayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var dateHolidayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemBlue
        label.textAlignment = .left
        return label
    }()
    
    lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "chevron.compact.right")?.withTintColor(.lightText)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "calendar")?.withTintColor(.systemBlue)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Public Method
    public func setupCell(data: Holiday) {
        nameHolidayLabel.text = data.name
        localNameHolidayLabel.text = data.localName
        dateHolidayLabel.text = data.date
    }
    
    // MARK: - Private Method
    private func setupUI() {
        selectionStyle = .none
        addSubviews()
        setupContraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(nameHolidayLabel)
        contentView.addSubview(localNameHolidayLabel)
        contentView.addSubview(calendarImageView)
        contentView.addSubview(dateHolidayLabel)
        contentView.addSubview(arrowImageView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            nameHolidayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameHolidayLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            nameHolidayLabel.trailingAnchor.constraint(equalTo: calendarImageView.leadingAnchor, constant: -5),
            
            localNameHolidayLabel.leadingAnchor.constraint(equalTo: nameHolidayLabel.leadingAnchor),
            localNameHolidayLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            localNameHolidayLabel.trailingAnchor.constraint(equalTo: nameHolidayLabel.trailingAnchor),
            
            calendarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            calendarImageView.trailingAnchor.constraint(equalTo: dateHolidayLabel.leadingAnchor, constant: -2),
            calendarImageView.heightAnchor.constraint(equalToConstant: 15),
            calendarImageView.widthAnchor.constraint(equalToConstant: 15),
            
            dateHolidayLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            dateHolidayLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -10),
            dateHolidayLabel.widthAnchor.constraint(equalToConstant: 95),
            
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            arrowImageView.heightAnchor.constraint(equalToConstant: 25),
            arrowImageView.widthAnchor.constraint(equalToConstant: 25),
        ])
    }
}
