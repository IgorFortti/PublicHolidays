//
//  ListViewModel.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import Foundation

// MARK: - Protocols
protocol ListViewModelDelegate: AnyObject {
    func successRequest()
    func failureRequest()
}

class ListViewModel {
    // MARK: - Properties
    weak var delegate: ListViewModelDelegate?
    private var coordinator: ListCoordinator
    var list: [Holiday] = []
    
    // MARK: - Initializer
    init(coordinator: ListCoordinator, list: [Holiday]) {
        self.coordinator = coordinator
        self.list = list
    }
    
    // MARK: - Public Methods
    public func didTapSelectedCell(holiday: Holiday) {
        coordinator.routeToDetail(holiday: holiday)
    }
    
}

