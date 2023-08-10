//
//  CountriesViewModel.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import Foundation

class CountriesViewModel {
    // MARK: - Properties
    private var coordinator: CountriesCoordinator
    var list: [Country] = []
    
    // MARK: - Initializer
    init(coordinator: CountriesCoordinator, list: [Country]) {
        self.coordinator = coordinator
        self.list = list
    }
}
