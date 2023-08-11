//
//  HomeCoordinator.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import Foundation
import UIKit

class HomeCoordinator {
    // MARK: - Properties
    private var navigationController: UINavigationController
    
    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public Methods
    public func start() {
        let vm = HomeViewModel(coordinator: self)
        let vc = HomeViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    public func routeToCountries(SelectionDelegate: CountriesViewModelSelectionDelegate) {
        
        let coordinator = CountriesCoordinator(navigationController: navigationController)
        coordinator.start(selectionDelegate: SelectionDelegate)
    }
    
    public func routeToHolidays(data: (String, Int)) {
        let coordinator = HolidaysCoordinator(navigationController: navigationController)
        coordinator.start(data: data)
    }
}
