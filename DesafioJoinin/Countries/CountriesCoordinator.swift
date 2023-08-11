//
//  CountriesCoordinator.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import Foundation
import UIKit
import FittedSheets

class CountriesCoordinator {
    // MARK: - Properties
    private var navigationController: UINavigationController
    
    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public Methods
    public func start(selectionDelegate: CountriesViewModelSelectionDelegate) {
        let vm = CountriesViewModel(coordinator: self, selectionDelegate: selectionDelegate)
        vm.fetchRequest { [weak self] success, errorMessage in
            if success {
                let vc = CountriesViewController(viewModel: vm)
                let sheet = SheetViewController(controller: vc, sizes: [.marginFromTop(400)])
                self?.navigationController.present(sheet, animated: false)
            } else {
                AlertController.shared.showAlert(title: "Error", message: errorMessage ?? "Unknow error",
                                                 controller: self?.navigationController ?? UINavigationController())
            }
        }
    }
    
    public func backToHome() {
        navigationController.dismiss(animated: false)
    }
}
