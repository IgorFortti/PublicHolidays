//
//  ListViewController.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import UIKit

class ListViewController: UIViewController {
    // MARK: - Properties
    var viewModel: ListViewModel
    var customView: ListView?
    
    // MARK: - Initializers
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func loadView() {
        super.loadView()
        customView = ListView(tableViewDelegate: self, tableViewDataSource: self)
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        title = "Public Holiday List"
    }
}
// MARK: - Extensions
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListHolidayTableViewCell.identifier, for: indexPath) as? ListHolidayTableViewCell
        cell?.setupCell(data: viewModel.list[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = viewModel.list[indexPath.row]
        viewModel.didTapSelectedCell(holiday: selectedCell)
    }
}
