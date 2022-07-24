//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit
import FlowUI

extension UILabel {
    static var h1: UILabel { .init(font: .systemFont(ofSize: 40, weight: .bold), textColor: .black) }
    static var h2: UILabel { .init(font: .systemFont(ofSize: 30, weight: .bold), textColor: .black) }
    static var h3: UILabel { .init(font: .systemFont(ofSize: 20, weight: .bold), textColor: .black) }
    static var subtitle: UILabel { .init(font: .systemFont(ofSize: 17, weight: .semibold), textColor: .darkGray) }
}

extension UIComponents {
    func label(_ styledLabel: UILabel, text: String) -> UILabel {
        styledLabel.text(text)
    }
}

class MiscViewController: UIViewController {

    // UI components

    private var centeredH1Label: UILabel { .h1.textAlignment(.center).textColor(.orange) }

    private lazy var stack = stack(.vertical) {

        centeredH1Label
            .text("Colors")

        UIView(color: .lightGray, height: 1)

        rows

        UIView(color: .lightGray, height: 1)

        space(height: 32)

        button(
            title: "Red button",
            style: .init(
                .font(.systemFont(ofSize: 17, weight: .bold)),
                .foregroundColor(.white),
                .backgroundColor(.red),
                .cornerRadius(8)
            ),
            type: .system
        )
        .size(height: 40)
        .addTouchUpInside {
            print("Button tapped")
        }
    }

    private lazy var rows = stack(.vertical, spacing: 8) {
        items.map { item in
            stack(.horizontal, distribution: .equalSpacing) {
                label(.h3, text: item.title)
                label(.subtitle, text: item.subtitle)
            }
            .wrappedInContainer()
        }
    }
    .wrappedInContainer(insets: .symmetry(h: 0, v: 8))

    private lazy var scrollView = scrollView()

    // Data source

    struct RowItem {
        var title: String
        var subtitle: String
    }

    private let items: [RowItem] = [
        .init(title: "Red", subtitle: "FF0000"),
        .init(title: "Green", subtitle: "00FF00"),
        .init(title: "Blue", subtitle: "0000FF"),
        .init(title: "Orange", subtitle: "FFA500"),
        .init(title: "Magenta", subtitle: "FF00FF"),
    ]

    // View controller

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - Private
private extension MiscViewController {
    func setup() {
        title = "Misc"

        view.backgroundColor = .white

        scrollView.addSubview(stack, insets: .symmetry(h: 16, v: 0))
        view.addSubview(scrollView, insets: .zero)
        stack.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive(true)
    }
}
