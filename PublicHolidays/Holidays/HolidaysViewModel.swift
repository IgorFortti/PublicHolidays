//
//  HolidaysViewModel.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import Foundation

class HolidaysViewModel {
    // MARK: - Properties
    private let service = Service()
    private let coordinator: HolidaysCoordinator
    private var list: [Holiday] = []
    
    public var getList: [Holiday] {
        return list
    }
    
    // MARK: - Initializer
    init(coordinator: HolidaysCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Public Methods
    public func fetchRequest(data: (String, Int), completion: @escaping (Bool, String?) -> Void) {
        service.getHolidays(countryCode: data.0,year: data.1) { [weak self] result, failure in
            if let result = result {
                self?.list = result
                completion(true, nil)
            } else {
                completion(false, failure?.localizedDescription)
            }
        }
    }
    public func didTapSelectedCell(holiday: Holiday) {
        coordinator.routeToDetail(holiday: holiday)
    }
}

