//
//  HomeViewModel.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import Foundation

// MARK: - Protocols
protocol HomeViewModelDelegate: AnyObject {
    func countrySelected(countryName: String)
    func countriesViewControllerDismiss()
}

class HomeViewModel {
    // MARK: - Properties
    weak var delegate: HomeViewModelDelegate?
    private let coordinator: HomeCoordinator
    private let service: Service = Service()
    
    private var countrySelected: Country? {
        didSet {
            delegate?.countrySelected(countryName: countrySelected?.name ?? "")
        }
    }
    
    // MARK: - Initializer
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Public Methods
    public func didTapContinue(year: String) {
        if let countryCode = countrySelected?.countryCode {
            coordinator.routeToHolidays(data: (countryCode, Int(year) ?? 0))
        }
    }
    
    public func didTapCountryTextField() {
        coordinator.routeToCountries(SelectionDelegate: self)
    }
}
// MARK: - Extensions
extension HomeViewModel: CountriesViewModelSelectionDelegate {
    func dismiss() {
        delegate?.countriesViewControllerDismiss()
    }
    
    func didSelectedCountry(country: Country) {
        countrySelected = country
    }
}
