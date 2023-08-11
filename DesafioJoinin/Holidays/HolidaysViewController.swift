//
//  HolidaysViewController.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import UIKit

class HolidaysViewController: UIViewController {
    // MARK: - Properties
    var viewModel: HolidaysViewModel
    var customView: HolidaysView?
    
    // MARK: - Initializers
    init(viewModel: HolidaysViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func loadView() {
        super.loadView()
        customView = HolidaysView(tableViewDelegate: self, tableViewDataSource: self)
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
extension HolidaysViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListHolidaysTableViewCell.identifier, for: indexPath) as? ListHolidaysTableViewCell
        cell?.setupCell(data: viewModel.list[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = viewModel.list[indexPath.row]
        viewModel.didTapSelectedCell(holiday: selectedCell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
