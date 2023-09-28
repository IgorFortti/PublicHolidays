//
//  CountriesViewModel.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import Foundation

protocol CountriesViewModelFilterDelegate: AnyObject {
    func filteredListReceivedData()
}

protocol CountriesViewModelSelectionDelegate: AnyObject {
    func didSelectedCountry(country: Country)
    func dismiss()
}

class CountriesViewModel {
    // MARK: - Properties
    weak var filterDelegate: CountriesViewModelFilterDelegate?
    weak var selectionDelegate: CountriesViewModelSelectionDelegate?
    private let service = Service()
    private let coordinator: CountriesCoordinator
    
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
    
    public var filteredList: [Country] = [] {
        didSet {
            filterDelegate?.filteredListReceivedData()
        }
    }
    
    // MARK: - Initializer
    init(coordinator: CountriesCoordinator,
         selectionDelegate: CountriesViewModelSelectionDelegate) {
        
        self.coordinator = coordinator
        self.selectionDelegate = selectionDelegate
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
    public func fetchRequest(completion: @escaping (Bool, String?) -> Void) {
        service.getCountries { [weak self] result, failure in
            if let result = result {
                self?.list = result
                completion(true, nil)
            } else {
                completion(false, failure?.localizedDescription)
            }
        }
    }
    
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
