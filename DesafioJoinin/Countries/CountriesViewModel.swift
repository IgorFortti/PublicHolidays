//
//  CountriesViewModel.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import Foundation

protocol CountriesFilterDelegate: AnyObject {
    func filteredListReceivedData()
}

protocol CountriesViewModelSelectionDelegate: AnyObject {
    func didSelectedCountry(country: Country)
}

class CountriesViewModel {
    // MARK: - Properties
    weak var filterDelegate: CountriesFilterDelegate?
    weak var selectionDelegate: CountriesViewModelSelectionDelegate?
    private var coordinator: CountriesCoordinator
    var filteredList: [Country] = [] {
        didSet {
            filterDelegate?.filteredListReceivedData()
        }
    }
    
    var list: [Country] = [] {
        didSet {
            updateFilteredList(with: searchText) // Atualiza a filteredList quando a list é definida
        }
    }
    
    private var searchText: String = "" {
        didSet {
            updateFilteredList(with: searchText) // Atualiza a filteredList quando o searchText muda
        }
    }
    
    
    
    // MARK: - Initializer
    init(coordinator: CountriesCoordinator, list: [Country], delegate: CountriesViewModelSelectionDelegate) {
        self.coordinator = coordinator
        self.list = list
        self.selectionDelegate = delegate
        updateFilteredList(with: "")
    }
    
    private func updateFilteredList(with searchText: String) {
        if searchText.isEmpty {
            filteredList = list
        } else {
            filteredList = list.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    public func updateSearchText(text: String) {
        searchText = text
    }
    
    public func didSelectedCountry(country: Country) {
        selectionDelegate?.didSelectedCountry(country: country)
        coordinator.backToHome()
    }
}
