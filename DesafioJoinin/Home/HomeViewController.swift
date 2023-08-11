//
//  HomeViewController.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import UIKit
import FittedSheets

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
        viewModel.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - Extensions
extension HomeViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        customView?.checkTextFields()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == customView?.countryTextField {
            view.endEditing(true)
            customView?.isCountryFieldEditing = true
            viewModel.didTapCountryTextField()
            return false
        }
        return true
    }
}

extension HomeViewController: HomeViewDelegate {
    func continueButtonTapped() {
        viewModel.didTapContinue(year: yearText)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func failureRequestCountries(message: String) {
        AlertController.shared.showAlert(title: "Error", message: message, controller: self)
    }
    
    func countriesViewControllerDismiss() {
        customView?.isCountryFieldEditing = false
    }
    
    func countrySelected() {
        customView?.countryTextField.text = viewModel.countrySelected?.name
    }
    
    
    func checkCountryCodeFailure(message: String) {
        AlertController.shared.showAlert(title: "Error", message: message, controller: self)
    }
    
    func getHolidayListFailure(message: String) {
        AlertController.shared.showAlert(title: "Error", message: message, controller: self)
    }
}
