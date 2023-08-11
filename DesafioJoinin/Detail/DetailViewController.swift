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
        customView = DetailView(holiday: viewModel.holiday)
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("%%%%\(viewModel.holiday)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        title = "\(viewModel.holiday.date ?? "")"
    }
}
