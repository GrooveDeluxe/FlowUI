//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit
import FlowUI

final class CatalogViewController: UIViewController {

    // UI components

    private lazy var tableView = UITableView()

    // Data source
    
    private var categories: [(name: String, module: UIViewController.Type)] = [
        (name: "Stacks", module: StacksViewController.self),
        (name: "Misc", module: MiscViewController.self)
    ]

    // View controller
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - Private
private extension CatalogViewController {
    func setup() {
        title = "Catalog"

        view.addSubview(tableView, insets: .zero)

        tableView.register(CatalogCell.self)
        tableView.separatorStyle = .none

        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource -
extension CatalogViewController: UITableViewDataSource {
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
extension CatalogViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let (_, module) = categories[indexPath.row]
        let vc = module.init()
        navigationController?.pushViewController(vc, animated: true)
    }
}

