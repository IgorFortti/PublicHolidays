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
    func dismiss()
}

class CountriesViewModel {
    // MARK: - Properties
    weak var filterDelegate: CountriesFilterDelegate?
    weak var selectionDelegate: CountriesViewModelSelectionDelegate?
    private var coordinator: CountriesCoordinator
    public var filteredList: [Country] = [] {
        didSet {
            filterDelegate?.filteredListReceivedData()
        }
    }
    
    private var list: [Country] = [] {
        didSet {
            updateFilteredList(searchText: searchText)
        }
    }
    
    private var searchText: String = "" {
        didSet {
            updateFilteredList(searchText: searchText)
        }
    }
    
    // MARK: - Initializer
    init(coordinator: CountriesCoordinator, list: [Country], delegate: CountriesViewModelSelectionDelegate) {
        self.coordinator = coordinator
        self.list = list
        self.selectionDelegate = delegate
        updateFilteredList(searchText: "")
    }
    
    // MARK: - Private Methods
    private func updateFilteredList(searchText: String) {
        if searchText.isEmpty {
            filteredList = list
        } else {
            filteredList = list.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    // MARK: - Public Methods
    public func updateSearchText(text: String) {
        searchText = text
    }
    
    public func didSelectedCountry(country: Country) {
        selectionDelegate?.didSelectedCountry(country: country)
        coordinator.backToHome()
    }
    
    public func dismiss() {
        selectionDelegate?.dismiss()
    }
}
