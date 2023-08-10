//
//  DetailView.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import Foundation
import UIKit

class DetailView: UIView {
    // MARK: - Properties
    lazy var bannerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Check out details and curiosities\nabout this public holiday"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var localNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var fixedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var globalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var lauchYearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // MARK: - Initialiers
    init(holiday: Holiday) {
        super.init(frame: .zero)
        populateDateLabel(text: holiday.date)
        populateNameLabel(text: holiday.name)
        populateLocalNameLabel(text: holiday.localName)
        populateLauchYearLabel(year: holiday.launchYear)
        populateFixedLabel(isFixed: holiday.fixed)
        populateGlobalLabel(isGlobal: holiday.global)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func populateDateLabel(text: String?) {
        dateLabel.text = text
    }
    
    private func populateLocalNameLabel(text: String?) {
        localNameLabel.text = text
    }
    
    private func populateNameLabel(text: String?) {
        nameLabel.text = text
    }
    
    private func populateLauchYearLabel(year: Int?) {
        if let launchYear = year {
            let lauchYearString = String(launchYear)
            lauchYearLabel.text = lauchYearString
        } else {
            lauchYearLabel.text = "Infelizmente, não sabemos em que ano esse feriado iniciou"
        }
    }
    
    private func populateFixedLabel(isFixed: Bool?) {
        if let fixed = isFixed {
            if fixed {
                fixedLabel.text = "Todo ano esse feriado está no mesmo dia, tá tranquilo"
            } else {
                fixedLabel.text = "Se programe, a cada ano esse feriado muda de data"
            }
        } else {
            fixedLabel.text = "Infelizmente, não sabemos se esse feríado é fixo"
        }
    }
    
    private func populateGlobalLabel(isGlobal: Bool?) {
        if let global = isGlobal {
            if global {
                globalLabel.text = "Esse é um feriado global, viaje sem se preocupar"
            } else {
                globalLabel.text = "Fique atento, pois esse não é um feriado global"
            }
        } else {
            globalLabel.text = "Infelizmente, não sabemos se esse feríado é global"
        }
    }
    
    
    
    private func setupUI() {
        backgroundColor = .white
        addSubviews()
        setupContraints()
    }
    
    
    private func addSubviews() {
        addSubview(bannerView)
        bannerView.addSubview(descriptionLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(localNameLabel)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(fixedLabel)
        stackView.addArrangedSubview(globalLabel)
        stackView.addArrangedSubview(lauchYearLabel)
        addSubview(stackView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 180),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 20),
            descriptionLabel.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
