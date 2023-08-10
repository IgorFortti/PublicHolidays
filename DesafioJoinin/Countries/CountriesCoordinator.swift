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
    public func start(list: [Country], delegate: CountriesViewModelSelectionDelegate) {
        let vm = CountriesViewModel(coordinator: self, list: list, delegate: delegate)
        let vc = CountriesViewController(viewModel: vm)
        let sheet = SheetViewController(controller: vc, sizes: [.fixed(600)])
        navigationController.present(sheet, animated: false)
    }
    
    public func backToHome() {
        navigationController.dismiss(animated: false)
    }
}
