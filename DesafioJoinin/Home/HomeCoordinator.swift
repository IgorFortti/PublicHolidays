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
    
    public func routeToCountries(SelectionDelegate: CountriesViewModelSelectionDelegate,
                                 failureRequestDelegate: CountriesViewModelRequestFailureDelegate) {
        
        let coordinator = CountriesCoordinator(navigationController: navigationController)
        coordinator.start(selectionDelegate: SelectionDelegate, failureRequestDelegate: failureRequestDelegate)
    }
    
    public func routeToList(list: [Holiday]) {
        let coordinator = HolidaysCoordinator(navigationController: navigationController)
        coordinator.start(list: list)
    }
}
