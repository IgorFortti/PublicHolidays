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
    func countrySelected()
}

class HomeViewModel {
    // MARK: - Properties
    weak var delegate: HomeViewModelDelegate?
    private var coordinator: HomeCoordinator
    private var service: Service = Service()
    var countryList: [Country] = []
    var countrySelected: Country? {
        didSet {
            delegate?.countrySelected()
        }
    }
    
    // MARK: - Initializer
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Private Methods
//    private func checkCountryCode(for countryName: String) -> String? {
//        return countryList.first { $0.name == countryName }?.countryCode
//    }
    
    // MARK: - Public Methods
    public func didTapContinue(year: String) {
        if let countryCode = countrySelected?.countryCode {
            service.getHolidayList(countryCode: countryCode, year: Int(year) ?? 0) { [weak self] result, failure in
                if let result = result {
                    self?.coordinator.routeToList(list: result)
                } else {
                    self?.delegate?.checkCountryCodeFailure(message: "Infelizmente, não há informação disponível para o ano informado")
                }
            }
        } else {
            delegate?.checkCountryCodeFailure(message: "Ocorreu um problema ao buscar os dados do país escolhido")
        }
    }
    
    public func didTapCountryTextField() {
        coordinator.routeToCountries(list: countryList, delegate: self)
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

extension HomeViewModel: CountriesViewModelSelectionDelegate {
    func didSelectedCountry(country: Country) {
        countrySelected = country
    }
}
