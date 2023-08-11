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
    public func start(selectionDelegate: CountriesViewModelSelectionDelegate,
                      failureRequestDelegate: CountriesViewModelRequestFailureDelegate) {
        
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        let vm = CountriesViewModel(coordinator: self,
                                    selectionDelegate: selectionDelegate,
                                    failureRequestDelegate: failureRequestDelegate)
        vm.fetchRequest() {
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            let vc = CountriesViewController(viewModel: vm)
            let sheet = SheetViewController(controller: vc, sizes: [.fixed(600)])
            self.navigationController.present(sheet, animated: false)
        }
    }
    
    public func backToHome() {
        navigationController.dismiss(animated: false)
    }
}
