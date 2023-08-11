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
    lazy var bannerDescriptionLabelView: UIView = {
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
        label.lineBreakMode = .byWordWrapping
        label.text = "Check out details and curiosities\nabout this public holiday"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var bannerLocalNameLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var localNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Local Name"
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var bannerLocalNameLabelDinamicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        return view
    }()
    
    lazy var localNameLabelDinamic: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    lazy var bannerNameLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.text = "Name"
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var bannerNameLabelDinamicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        return view
    }()
    
    lazy var nameLabelDinamic: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    lazy var bannerFixedLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var fixedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.text = "Is this holiday fixed?"
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var bannerFixedLabelDinamicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        return view
    }()
    
    lazy var fixedLabelDinamic: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    lazy var bannerGlobalLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var globalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.text = "Is this holiday global?"
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var bannerGlobalLabelDinamicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        return view
    }()
    
    lazy var globalLabelDinamic: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    lazy var bannerLaunchYearLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var launchYearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.text = "Lauch Year"
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var bannerLaunchYearLabelDinamicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        return view
    }()
    
    lazy var launchYearLabelDinamic: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.backgroundColor = .white
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
        populateNameLabelDinamic(text: holiday.name)
        populateLocalNameLabelDinamic(text: holiday.localName)
        populateLauchYearLabelDinamic(year: holiday.launchYear)
        populateFixedLabelDinamic(isFixed: holiday.fixed)
        populateGlobalLabelDinamic(isGlobal: holiday.global)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func populateLocalNameLabelDinamic(text: String?) {
        localNameLabelDinamic.text = text
    }
    
    private func populateNameLabelDinamic(text: String?) {
        nameLabelDinamic.text = text
    }
    
    private func populateLauchYearLabelDinamic(year: Int?) {
        if let launchYear = year {
            let lauchYearString = String(launchYear)
            launchYearLabelDinamic.text = lauchYearString
        } else {
            launchYearLabelDinamic.text = "There is no record of the launch year of this holiday"
        }
    }
    
    private func populateFixedLabelDinamic(isFixed: Bool?) {
        if let fixed = isFixed {
            if fixed {
                fixedLabelDinamic.text = "This is a fixed holiday"
            } else {
                fixedLabelDinamic.text = "This isn't a fixed holiday"
            }
        } else {
            fixedLabelDinamic.text = "There is no record about this holiday being fixed or not"
        }
    }
    
    private func populateGlobalLabelDinamic(isGlobal: Bool?) {
        if let global = isGlobal {
            if global {
                globalLabelDinamic.text = "This is a global holiday"
            } else {
                globalLabelDinamic.text = "This isn't a global holiday"
            }
        } else {
            globalLabelDinamic.text = "There is no record about this holiday being global or not"
        }
    }
    
    
    
    private func setupUI() {
        backgroundColor = .white
        addSubviews()
        setupContraints()
    }
    
    
    private func addSubviews() {
        addSubview(bannerDescriptionLabelView)
        bannerDescriptionLabelView.addSubview(descriptionLabel)
        addSubview(stackView)
        
        stackView.addArrangedSubview(bannerNameLabelView)
        bannerNameLabelView.addSubview(nameLabel)
        bannerNameLabelView.addSubview(bannerNameLabelDinamicView)
        bannerNameLabelDinamicView.addSubview(nameLabelDinamic)
        
        stackView.addArrangedSubview(bannerLocalNameLabelView)
        bannerLocalNameLabelView.addSubview(localNameLabel)
        bannerLocalNameLabelView.addSubview(bannerLocalNameLabelDinamicView)
        bannerLocalNameLabelDinamicView.addSubview(localNameLabelDinamic)
        
        stackView.addArrangedSubview(bannerGlobalLabelView)
        bannerGlobalLabelView.addSubview(globalLabel)
        bannerGlobalLabelView.addSubview(bannerGlobalLabelDinamicView)
        bannerGlobalLabelDinamicView.addSubview(globalLabelDinamic)
        
        stackView.addArrangedSubview(bannerFixedLabelView)
        bannerFixedLabelView.addSubview(fixedLabel)
        bannerFixedLabelView.addSubview(bannerFixedLabelDinamicView)
        bannerFixedLabelDinamicView.addSubview(fixedLabelDinamic)
        
        stackView.addArrangedSubview(bannerLaunchYearLabelView)
        bannerLaunchYearLabelView.addSubview(launchYearLabel)
        bannerLaunchYearLabelView.addSubview(bannerLaunchYearLabelDinamicView)
        bannerLaunchYearLabelDinamicView.addSubview(launchYearLabelDinamic)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            bannerDescriptionLabelView.topAnchor.constraint(equalTo: topAnchor),
            bannerDescriptionLabelView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerDescriptionLabelView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerDescriptionLabelView.heightAnchor.constraint(equalToConstant: 180),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: bannerDescriptionLabelView.leadingAnchor, constant: 20),
            descriptionLabel.bottomAnchor.constraint(equalTo: bannerDescriptionLabelView.bottomAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: bannerDescriptionLabelView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            bannerNameLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bannerNameLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            nameLabel.topAnchor.constraint(equalTo: bannerNameLabelView.topAnchor, constant: 5),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bannerNameLabelDinamicView.topAnchor.constraint(equalTo: bannerNameLabelView.topAnchor, constant: 28),
            bannerNameLabelDinamicView.leadingAnchor.constraint(equalTo: bannerNameLabelView.leadingAnchor, constant: 10),
            bannerNameLabelDinamicView.trailingAnchor.constraint(equalTo: bannerNameLabelView.trailingAnchor, constant: -10),
            bannerNameLabelDinamicView.bottomAnchor.constraint(equalTo: bannerNameLabelView.bottomAnchor, constant: -10),
            
            nameLabelDinamic.centerYAnchor.constraint(equalTo: bannerNameLabelDinamicView.centerYAnchor),
            nameLabelDinamic.leadingAnchor.constraint(equalTo: bannerNameLabelDinamicView.leadingAnchor),
            nameLabelDinamic.trailingAnchor.constraint(equalTo: bannerNameLabelDinamicView.trailingAnchor),
            
            bannerLocalNameLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bannerLocalNameLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            localNameLabel.topAnchor.constraint(equalTo: bannerLocalNameLabelView.topAnchor, constant: 5),
            localNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bannerLocalNameLabelDinamicView.topAnchor.constraint(equalTo: bannerLocalNameLabelView.topAnchor, constant: 28),
            bannerLocalNameLabelDinamicView.leadingAnchor.constraint(equalTo: bannerLocalNameLabelView.leadingAnchor, constant: 10),
            bannerLocalNameLabelDinamicView.trailingAnchor.constraint(equalTo: bannerLocalNameLabelView.trailingAnchor, constant: -10),
            bannerLocalNameLabelDinamicView.bottomAnchor.constraint(equalTo: bannerLocalNameLabelView.bottomAnchor, constant: -10),
            
            localNameLabelDinamic.centerYAnchor.constraint(equalTo: bannerLocalNameLabelDinamicView.centerYAnchor),
            localNameLabelDinamic.leadingAnchor.constraint(equalTo: bannerLocalNameLabelDinamicView.leadingAnchor),
            localNameLabelDinamic.trailingAnchor.constraint(equalTo: bannerLocalNameLabelDinamicView.trailingAnchor),
            
            bannerGlobalLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bannerGlobalLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            globalLabel.topAnchor.constraint(equalTo: bannerGlobalLabelView.topAnchor, constant: 5),
            globalLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bannerGlobalLabelDinamicView.topAnchor.constraint(equalTo: bannerGlobalLabelView.topAnchor, constant: 28),
            bannerGlobalLabelDinamicView.leadingAnchor.constraint(equalTo: bannerGlobalLabelView.leadingAnchor, constant: 10),
            bannerGlobalLabelDinamicView.trailingAnchor.constraint(equalTo: bannerGlobalLabelView.trailingAnchor, constant: -10),
            bannerGlobalLabelDinamicView.bottomAnchor.constraint(equalTo: bannerGlobalLabelView.bottomAnchor, constant: -10),
            
            globalLabelDinamic.centerYAnchor.constraint(equalTo: bannerGlobalLabelDinamicView.centerYAnchor),
            globalLabelDinamic.leadingAnchor.constraint(equalTo: bannerGlobalLabelDinamicView.leadingAnchor),
            globalLabelDinamic.trailingAnchor.constraint(equalTo: bannerGlobalLabelDinamicView.trailingAnchor),
            
            bannerFixedLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bannerFixedLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            fixedLabel.topAnchor.constraint(equalTo: bannerFixedLabelView.topAnchor, constant: 5),
            fixedLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bannerFixedLabelDinamicView.topAnchor.constraint(equalTo: bannerFixedLabelView.topAnchor, constant: 28),
            bannerFixedLabelDinamicView.leadingAnchor.constraint(equalTo: bannerFixedLabelView.leadingAnchor, constant: 10),
            bannerFixedLabelDinamicView.trailingAnchor.constraint(equalTo: bannerFixedLabelView.trailingAnchor, constant: -10),
            bannerFixedLabelDinamicView.bottomAnchor.constraint(equalTo: bannerFixedLabelView.bottomAnchor, constant: -10),
            
            fixedLabelDinamic.centerYAnchor.constraint(equalTo: bannerFixedLabelDinamicView.centerYAnchor),
            fixedLabelDinamic.leadingAnchor.constraint(equalTo: bannerFixedLabelDinamicView.leadingAnchor),
            fixedLabelDinamic.trailingAnchor.constraint(equalTo: bannerFixedLabelDinamicView.trailingAnchor),
            
            bannerLaunchYearLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bannerLaunchYearLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            launchYearLabel.topAnchor.constraint(equalTo: bannerLaunchYearLabelView.topAnchor, constant: 5),
            launchYearLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bannerLaunchYearLabelDinamicView.topAnchor.constraint(equalTo: bannerLaunchYearLabelView.topAnchor, constant: 28),
            bannerLaunchYearLabelDinamicView.leadingAnchor.constraint(equalTo: bannerLaunchYearLabelView.leadingAnchor, constant: 10),
            bannerLaunchYearLabelDinamicView.trailingAnchor.constraint(equalTo: bannerLaunchYearLabelView.trailingAnchor, constant: -10),
            bannerLaunchYearLabelDinamicView.bottomAnchor.constraint(equalTo: bannerLaunchYearLabelView.bottomAnchor, constant: -10),
            
            launchYearLabelDinamic.leadingAnchor.constraint(equalTo: bannerLaunchYearLabelDinamicView.leadingAnchor),
            launchYearLabelDinamic.trailingAnchor.constraint(equalTo: bannerLaunchYearLabelDinamicView.trailingAnchor),
            launchYearLabelDinamic.centerYAnchor.constraint(equalTo: bannerLaunchYearLabelDinamicView.centerYAnchor),
        ])
    }
}
