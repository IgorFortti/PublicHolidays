//
//  DetailViewController.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties
    private var viewModel: DetailViewModel
    private var customView: DetailView?
    
    // MARK: - Initializers
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides Methods
    override func loadView() {
        super.loadView()
        customView = DetailView(holidayName: viewModel.holidayName,
                                holidayLocalName: viewModel.holidayLocalName,
                                holidayLaunchYear: viewModel.holidayLaunchYear,
                                holidayFixed: viewModel.holidayFixed,
                                holidayGlobal: viewModel.holidayGlobal)
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        title = viewModel.detailViewControllerTitle
    }
}
