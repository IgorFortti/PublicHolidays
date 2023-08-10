//
//  HolidaysViewModel.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import Foundation

// MARK: - Protocols

class HolidaysViewModel {
    // MARK: - Properties
    private var coordinator: HolidaysCoordinator
    var list: [Holiday] = []
    
    // MARK: - Initializer
    init(coordinator: HolidaysCoordinator, list: [Holiday]) {
        self.coordinator = coordinator
        self.list = list
    }
    
    // MARK: - Public Methods
    public func didTapSelectedCell(holiday: Holiday) {
        coordinator.routeToDetail(holiday: holiday)
    }
    
}

