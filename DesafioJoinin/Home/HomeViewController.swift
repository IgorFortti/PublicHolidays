//
//  HomeViewController.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    private var viewModel: HomeViewModel
    private var customView: HomeView?
    
    private var countryText: String {
        return customView?.countryTextField.text ?? ""
    }
    
    private var yearText: String {
        return customView?.yearTextField.text ?? ""
    }
    
    // MARK: - Initializers
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func loadView() {
        super.loadView()
        customView = HomeView(viewDelegate: self, textFieldsDelegate: self)
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCountryList()
        viewModel.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - Extensions
extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == customView?.countryTextField {
            if yearText == "" {
                textField.resignFirstResponder()
                customView?.yearTextField.becomeFirstResponder()
            }
            textField.resignFirstResponder()
        } else {
            if countryText == "" {
                textField.resignFirstResponder()
                customView?.countryTextField.becomeFirstResponder()
            }
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        customView?.checkTextFields()
    }
}

extension HomeViewController: HomeViewDelegate {
    func continueButtonTapped() {
        viewModel.didTapContinue(country: countryText, year: yearText)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func checkCountryCodeFailure(message: String) {
        print(message)
    }
    
    func getHolidayListFailure(message: String) {
        print(message)
    }
}
