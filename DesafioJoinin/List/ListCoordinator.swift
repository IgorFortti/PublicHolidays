//
//  ListCoordinator.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import Foundation
import UIKit

class ListCoordinator {
    // MARK: - Properties
    private var navigationController: UINavigationController
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public Methods
    public func start(list: [Holiday]) {
        let vm = ListViewModel(coordinator: self, list: list)
        let vc = ListViewController(viewModel: vm)
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    public func routeToDetail(holiday: Holiday) {
        let coordinator = DetailCoordinator(navigationController: navigationController)
        coordinator.start(holiday: holiday)
    }
    
    public func routeToBack() {
        navigationController.popViewController(animated: true)
    }
    
}
