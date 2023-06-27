//
//  Created by Dmitry Sochnev.
//  Copyright © 2023 Dmitry Sochnev. All rights reserved.
//

import UIKit
import FlowUI

final class ControlsCatalogViewController: UIViewController {

    // UI components

    private lazy var tableView = UITableView()

    // Data source

    private var categories: [(name: String, module: UIViewController.Type)] = [
        (name: "Buttons", module: ButtonsViewController.self),
        (name: "Other controls", module: OtherControlsViewController.self)
    ]

    // View controller

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - Private
private extension ControlsCatalogViewController {
    func setup() {
        title = "Controls"

        view.addSubview(tableView, insets: .zero)

        tableView.register(CatalogCell.self)
        tableView.separatorStyle = .none

        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource -
extension ControlsCatalogViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(CatalogCell.self, for: indexPath)
        let (name, _) = categories[indexPath.row]
        cell.configure(CatalogCellModel(title: name))
        return cell
    }
}

// MARK: - UITableViewDelegate -
extension ControlsCatalogViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let (_, module) = categories[indexPath.row]
        let vc = module.init()
        navigationController?.pushViewController(vc, animated: true)
    }
}
