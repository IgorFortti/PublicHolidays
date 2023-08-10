//
//  HomeView.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import UIKit

// MARK: - Protocols
protocol HomeViewDelegate: AnyObject {
    func continueButtonTapped()
}

class HomeView: UIView {
    // MARK: - Properties
    weak var delegate: HomeViewDelegate?
    
    lazy var bannerImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        image.image = UIImage(named: "BGBlue")
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to\nCheck Holidays"
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose a country"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var countryTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.clipsToBounds = true
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        textField.setCenteredPlaceholder(text: "Click Here")
        textField.keyboardType = .default
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = false
        return textField
    }()
    
    private lazy var countryArrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.addTarget(self, action: #selector(countryArrowButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var isCountryFieldEditing = false {
        didSet {
            updateArrowRotation()
        }
    }
    
    lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Type a year"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var yearTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.clipsToBounds = true
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        textField.setCenteredPlaceholder(text: "Example: 2020, 2023, 2026")
        textField.keyboardType = .numberPad
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = false
        textField.addToolbarWithDoneButton(target: self, action: #selector(doneButtonTapped))
        return textField
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = .systemGray
        button.setTitle("Choose a country and type a year\nto continue", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers
    init(viewDelegate: HomeViewDelegate, textFieldsDelegate: UITextFieldDelegate) {
        super.init(frame: .zero)
        self.delegate = viewDelegate
        self.countryTextField.delegate = textFieldsDelegate
        self.yearTextField.delegate = textFieldsDelegate
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Objc Method
    @objc func continueButtonTapped() {
        delegate?.continueButtonTapped()
    }
    
    @objc private func doneButtonTapped() {
        yearTextField.resignFirstResponder()
    }
    
    // MARK: - Public Method
    public func checkTextFields() {
        let isCountryFieldEmpty = countryTextField.text?.isEmpty ?? true
        let isYearFieldEmpty = yearTextField.text?.isEmpty ?? true
        let isYearFieldValid = yearTextField.text?.count == 4
        let areTextFieldsPopulated = !isCountryFieldEmpty && !isYearFieldEmpty && isYearFieldValid
        enableButton(areTextFieldsPopulate: areTextFieldsPopulated)
    }
    
    
    
    // MARK: - Private Methods
    private func setupUI() {
        backgroundColor = .systemGray6
        addSubviews()
        setupContraints()
    }
    
    @objc private func countryArrowButtonTapped() {
        countryTextField.becomeFirstResponder()
    }
    
    private func updateArrowRotation() {
        let rotationAngle: CGFloat = isCountryFieldEditing ? .pi : 0.0
        UIView.animate(withDuration: 0.3) {
            self.countryArrowButton.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }
    }
    
    private func enableButton(areTextFieldsPopulate: Bool) {
        if areTextFieldsPopulate {
            continueButton.backgroundColor = .systemBlue
            continueButton.setTitle("NEXT", for: .normal)
        } else {
            continueButton.backgroundColor = .systemGray
            continueButton.setTitle("Choose a country and type a year\nto continue", for: .normal)
        }
    }
    
    private func addSubviews() {
        addSubview(bannerImageView)
        bannerImageView.addSubview(titleLabel)
        addSubview(countryLabel)
        addSubview(countryTextField)
        countryTextField.addSubview(countryArrowButton)
        addSubview(yearLabel)
        addSubview(yearTextField)
        addSubview(continueButton)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerImageView.heightAnchor.constraint(equalToConstant: 180),
            
            titleLabel.leadingAnchor.constraint(equalTo: bannerImageView.leadingAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: -20),
            
            countryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            countryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            countryTextField.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 10),
            countryTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            countryTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            countryTextField.heightAnchor.constraint(equalToConstant: 56),
            
            countryArrowButton.centerYAnchor.constraint(equalTo: countryTextField.centerYAnchor),
            countryArrowButton.trailingAnchor.constraint(equalTo: countryTextField.trailingAnchor, constant: -5),
            countryArrowButton.heightAnchor.constraint(equalToConstant: 30),
            countryArrowButton.widthAnchor.constraint(equalToConstant: 30),
            
            yearLabel.topAnchor.constraint(equalTo: countryTextField.bottomAnchor, constant: 20),
            yearLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            yearTextField.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 10),
            yearTextField.leadingAnchor.constraint(equalTo: countryTextField.leadingAnchor),
            yearTextField.trailingAnchor.constraint(equalTo: countryTextField.trailingAnchor),
            yearTextField.heightAnchor.constraint(equalTo: countryTextField.heightAnchor),
            
            continueButton.topAnchor.constraint(equalTo: yearTextField.bottomAnchor, constant: 50),
            continueButton.leadingAnchor.constraint(equalTo: countryTextField.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: countryTextField.trailingAnchor),
            continueButton.heightAnchor.constraint(equalTo: countryTextField.heightAnchor),
        ])
    }
}
