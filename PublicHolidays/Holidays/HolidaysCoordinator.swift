//
//  HolidaysCoordinator.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import Foundation
import UIKit

class HolidaysCoordinator {
    // MARK: - Properties
    private let navigationController: UINavigationController
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public Methods
    public func start(data: (String, Int)) {
        let vm = HolidaysViewModel(coordinator: self)
        vm.fetchRequest(data: data) { [weak self] success, errorMessage in
            if success {
                let vc = HolidaysViewController(viewModel: vm)
                self?.navigationController.pushViewController(vc, animated: true)
            } else {
                AlertController.shared.showAlert(title: "Error", message: errorMessage ?? "Unknow error",
                                                 controller: self?.navigationController ?? UINavigationController())
            }
        }
    }
    
    public func routeToDetail(holiday: Holiday) {
        let coordinator = DetailCoordinator(navigationController: navigationController)
        coordinator.start(holiday: holiday)
    }
}
