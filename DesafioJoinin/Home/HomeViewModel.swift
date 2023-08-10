//
//  HomeViewModel.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import Foundation

// MARK: - Protocols
protocol HomeViewModelDelegate: AnyObject {
    func checkCountryCodeFailure(message: String)
    func getHolidayListFailure(message: String)
}

class HomeViewModel {
    // MARK: - Properties
    weak var delegate: HomeViewModelDelegate?
    private var coordinator: HomeCoordinator
    private var service: Service = Service()
    var countryList: [Country] = []
    
    // MARK: - Initializer
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Private Methods
    private func checkCountryCode(for countryName: String) -> String? {
        return countryList.first { $0.name == countryName }?.countryCode
    }
    
    // MARK: - Public Methods
    public func didTapContinue(country: String, year: String) {
        if let countryCode = checkCountryCode(for: country) {
            service.getHolidayList(countryCode: countryCode, year: Int(year) ?? 0) { [weak self] result, failure in
                if let result = result {
                    self?.coordinator.routeToList(list: result)
                } else {
                    self?.delegate?.checkCountryCodeFailure(message: "Infelizmente, não há informação disponível para o ano informado")
                }
            }
        } else {
            delegate?.checkCountryCodeFailure(message: "O País digitado não existe ou a digitação está incorreta")
        }
    }
    
    public func didTapCountryTextField() {
        coordinator.routeToCountries(list: countryList)
    }
    
    public func getCountryList() {
        service.getCountryList { [weak self] result, failure in
            if let result = result {
                self?.countryList = result
            } else {
                
            }
        }
    }
}
