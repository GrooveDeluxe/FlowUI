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

    private let labelAttributedTitle = NSAttributedString(
        string: "Label Attributed Title",
        attributes: [
            .font: UIFont.boldSystemFont(ofSize: 20),
            .foregroundColor: UIColor.magenta
        ]
    )

    private let buttonAttributedTitle = NSAttributedString(
        string: "Button Attributed Title",
        attributes: [
            .font: UIFont.boldSystemFont(ofSize: 24),
            .foregroundColor: UIColor.cyan
        ]
    )

    private lazy var leftToRightLabel = label("Left to right")
        .contentCompressionResistancePriority(.defaultLow, for: .horizontal)

    private lazy var rightToLeftLabel = label("من اليمين الى اليسار")

    private lazy var stack = stack(.vertical) {

        centeredH1Label
            .text("Colors")

        UIView(color: .lightGray, height: 1)

        rows

        UIView(color: .lightGray, height: 1)

        space(height: 32)

        button("Red button", type: .system)
            .titleFont(.systemFont(ofSize: 17, weight: .bold))
            .titleColor(.white)
            .backgroundColor(.red)
            .size(height: 40)
            .cornerRadius(8)
            .addTouchUpInside {
                print("Red button tapped")
            }

        space(height: 32)

        label(labelAttributedTitle)
            .isUserInteractionEnabled(true)
            .configure { [weak self] in
                print("label - \(type(of: $0))")
                let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(labelLongPress))
                $0.addGestureRecognizer(recognizer)
            }

        space(height: 32)

        button(buttonAttributedTitle)
            .backgroundColor(.orange)
            .cornerRadius(8)
            .size(height: 40)
            .addTouchUpInside {
                print("Attributed button tapped")
            }
            .configure { [weak self] in
                print("button - \(type(of: $0))")
                self?.attributedButton = $0
                $0.addTarget(self, action: #selector(buttonTouchUpOutside), for: .touchUpOutside)
            }

        space(height: 32)

        button()
            .backgroundColor(.blue)
            .cornerRadius(20)
            .size(height: 40)
            .border(color: .black, width: 2)
            .addTouchUpInside {
                print("Empty button tapped")
            }

        space(height: 32)

        button(.testImage, size: .init(width: 100, height: 60))
            .cornerRadius(15)
            .clipsToBounds()
            .border(color: .red, width: 2)
            .addTouchUpInside {
                print("Image button tapped")
            }
            .wrappedInContainer(pinnedTo: .top, .bottom, .centerX)

        space(height: 32)

        activityIndicator(.large)
            .animated(true)

        space(height: 32)

        container {
            $0.addSubview(
                self.leftToRightLabel,
                pinnedTo: .top.greaterThanOrEqual, .bottom.greaterThanOrEqual, .leading, .centerY
            )
            $0.addSubview(
                self.rightToLeftLabel,
                pinnedTo: .top.greaterThanOrEqual, .bottom.greaterThanOrEqual, .trailing, .centerY
            )
            self.rightToLeftLabel.leadingAnchor.constraint(
                equalTo: self.leftToRightLabel.trailingAnchor, constant: 8
            ).isActive(true)
        }
        .size(height: 40)

        space(height: 32)
    }

    private var attributedButton: UIButton? {
        didSet {
            guard let attributedButton = attributedButton else { return }
            print("attributedButton set - \(attributedButton)")
        }
    }

    private let optionalView: UIView? = nil

    private lazy var rows = stack(.vertical, spacing: 8) {
        items.map { item in
            stack(.horizontal, distribution: .equalSpacing) {
                label(.h3, text: item.title)
                label(.subtitle, text: item.subtitle)
            }
            .addTapGestureRecognizer {
                print("Tap - \(item.title)")
            }
        }
        optionalView
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

    @objc func labelLongPress() {
        print("label long tap")
    }

    @objc func buttonTouchUpOutside() {
        print("button touch up outside")
    }
}
