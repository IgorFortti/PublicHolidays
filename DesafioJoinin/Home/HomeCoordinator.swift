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
    
    public func routeToCountries(list: [Country], delegate: CountriesViewModelSelectionDelegate) {
        let coordinator = CountriesCoordinator(navigationController: navigationController)
        coordinator.start(list: list, delegate: delegate)
    }
    
    public func routeToList(list: [Holiday]) {
        let coordinator = ListCoordinator(navigationController: navigationController)
        coordinator.start(list: list)
    }
}
