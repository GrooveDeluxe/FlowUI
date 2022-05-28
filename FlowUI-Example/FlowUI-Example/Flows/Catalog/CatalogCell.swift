//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit
import FlowUI

struct CatalogCellModel {
    let title: String
}

final class CatalogCell: UITableViewCell {

    private lazy var titleLabel = label()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func configure(_ model: CatalogCellModel) {
        titleLabel
            .text(model.title)
            .apply(.custom([.font: UIFont.systemFont(ofSize: 24, weight: .bold)]))
    }
}

// MARK: - Private
private extension CatalogCell {
    func setup() {
        selectionStyle = .none
        contentView.addSubview(titleLabel, insets: .symmetry(h: 24, v: 16))
    }
}
