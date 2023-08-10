//
//  DetailViewModel.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import Foundation

class DetailViewModel {
    // MARK: - Properties
    private var coordinator: DetailCoordinator
    var holiday: Holiday
    
    // MARK: - Initializer
    init(coordinator: DetailCoordinator, holiday: Holiday) {
        self.coordinator = coordinator
        self.holiday = holiday
    }
}
