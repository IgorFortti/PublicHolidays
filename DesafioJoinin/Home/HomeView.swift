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
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Código do País"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
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
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.attributedPlaceholder = NSAttributedString(string: "Digite o código do País a ser buscado",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
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
        label.text = "Ano"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
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
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.attributedPlaceholder = NSAttributedString(string: "Digite o ano a ser buscado",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
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
        button.setTitle("Preencha o país e o ano para continuar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
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
            continueButton.setTitle("CONTINUAR", for: .normal)
        } else {
            continueButton.backgroundColor = .systemGray
            continueButton.setTitle("Preencha o país e o ano para continuar", for: .normal)
        }
    }
    
    private func addSubviews() {
        addSubview(countryLabel)
        addSubview(countryTextField)
        countryTextField.addSubview(countryArrowButton)
        addSubview(yearLabel)
        addSubview(yearTextField)
        addSubview(continueButton)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            countryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            countryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            countryTextField.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 5),
            countryTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            countryTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            countryTextField.heightAnchor.constraint(equalToConstant: 40),
            
            countryArrowButton.centerYAnchor.constraint(equalTo: countryTextField.centerYAnchor),
            countryArrowButton.trailingAnchor.constraint(equalTo: countryTextField.trailingAnchor, constant: -5),
            countryArrowButton.heightAnchor.constraint(equalToConstant: 30),
            countryArrowButton.widthAnchor.constraint(equalToConstant: 30),
            
            yearLabel.topAnchor.constraint(equalTo: countryTextField.bottomAnchor, constant: 20),
            yearLabel.leadingAnchor.constraint(equalTo: countryLabel.leadingAnchor),
            
            yearTextField.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 5),
            yearTextField.leadingAnchor.constraint(equalTo: countryTextField.leadingAnchor),
            yearTextField.trailingAnchor.constraint(equalTo: countryTextField.trailingAnchor),
            yearTextField.heightAnchor.constraint(equalTo: countryTextField.heightAnchor),
            
            continueButton.topAnchor.constraint(equalTo: yearTextField.bottomAnchor, constant: 40),
            continueButton.leadingAnchor.constraint(equalTo: countryTextField.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: countryTextField.trailingAnchor),
            continueButton.heightAnchor.constraint(equalTo: countryTextField.heightAnchor),
        ])
    }
}
