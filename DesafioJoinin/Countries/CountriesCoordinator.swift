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
    public func start(list: [Country]) {
        let vm = CountriesViewModel(coordinator: self, list: list)
        let vc = CountriesViewController(viewModel: vm)
        let sheet = SheetViewController(controller: vc, sizes: [.fixed(400)])
        navigationController.present(sheet, animated: false)
    }
    
    public func backToHome(list: [Holiday]) {
        navigationController.dismiss(animated: false)
    }
}
