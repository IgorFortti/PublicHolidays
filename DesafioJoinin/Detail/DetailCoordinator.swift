//
//  DetailCoordinator.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import Foundation
import UIKit

class DetailCoordinator {
    // MARK: - Properties
    private let navigationController: UINavigationController
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public Methods
    public func start(holiday: Holiday) {
        let vm = DetailViewModel(coordinator: self, holiday: holiday)
        let vc = DetailViewController(viewModel: vm)
        self.navigationController.pushViewController(vc, animated: true)
    }
}

