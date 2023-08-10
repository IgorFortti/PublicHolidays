//
//  CountriesViewModel.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import Foundation

protocol CountriesViewModelDelegate: AnyObject {
    func didSelectedCountry(country: Country)
}

class CountriesViewModel {
    // MARK: - Properties
    weak var delegate: CountriesViewModelDelegate?
    private var coordinator: CountriesCoordinator
    var list: [Country] = []
    
    // MARK: - Initializer
    init(coordinator: CountriesCoordinator, list: [Country], delegate: CountriesViewModelDelegate) {
        self.coordinator = coordinator
        self.list = list
        self.delegate = delegate
    }
    
    public func didSelectedCountry(country: Country) {
        delegate?.didSelectedCountry(country: country)
        coordinator.backToHome()
    }
}
