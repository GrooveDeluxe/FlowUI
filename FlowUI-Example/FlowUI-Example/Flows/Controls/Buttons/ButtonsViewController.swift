//
//  Created by Dmitry Sochnev.
//  Copyright © 2023 Dmitry Sochnev. All rights reserved.
//

import UIKit
import FlowUI

extension UIComponents {
    func buttonPrimary(_ title: String) -> UIButton {
        button(title, type: .system)
            .titleFont(.systemFont(ofSize: 18, weight: .semibold))
            .backgroundColor(.blue)
            .titleColor(.white)
            .cornerRadius(12)
            .size(height: 40)
    }
}

final class ButtonsViewController: UIViewController {

    typealias VC = ButtonsViewController
    typealias VM = ButtonsViewModelProtocol

    private let viewModel: VM? = ButtonsViewModel()

    private var buttonTitle: String? {
        didSet {
            print("ButtonsVC: buttonTitle set to (\"\(buttonTitle ?? "nil")\")")
        }
    }

    // UI components

    @UIViewBuilder private var buttons: [UIView] {
        // MARK: Bindings to object method
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Binding to reference type object method")
            buttonPrimary("Action 1")
                .addAction(on: self, do: VC.onButton)
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Binding to value type object method")
            buttonPrimary("Action 2")
                .addAction(on: viewModel, do: VM.onButton)
        }

        // MARK: Bindings to object method with control's value by keyPath
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Binding to reference type object method with control's value by keyPath")
            buttonPrimary("Action 3")
                .addAction(keyPath: \.currentTitle, on: self, do: VC.onButtonWithValue)
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Binding to value type object method with control's value by keyPath")
            buttonPrimary("Action 4")
                .addAction(keyPath: \.currentTitle, on: viewModel, do: VM.onButtonWithValue)
        }

        // MARK: Bindings to object method with sender
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Binding to reference type object method with sender")
            buttonPrimary("Action 5")
                .addActionWithSender(on: self, do: VC.onButtonWithSender)
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Binding to value type object method with sender")
            buttonPrimary("Action 6")
                .addActionWithSender(on: viewModel, do: VM.onButtonWithSender)
        }

        // MARK: Binding control value by keyPath to object's keyPath
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Binding control value by keyPath to object's keyPath")
            buttonPrimary("Action 7")
                .addAction(keyPath: \.currentTitle, on: self, to: \.buttonTitle)
        }

        // MARK: Actions with object
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with reference type object (unretained)")
            buttonPrimary("Action 8")
                .addAction(with: self) {
                    print("ButtonsVC: action with object - \($0)")
                }
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with value type object (for methods consistency)")
            buttonPrimary("Action 9")
                .addAction(with: viewModel) {
                    print("ButtonsVC: action with object - \($0)")
                }
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with reference type object and control's value by keyPath")
            buttonPrimary("Action 10")
                .addAction(keyPath: \.currentTitle, with: self) {
                    print("ButtonsVC: action with object - \($0) and value - \($1 ?? "nil")")
                }
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle,
                  text: "Action with value type object and control's value by keyPath (for methods consistency)")
            buttonPrimary("Action 11")
                .addAction(keyPath: \.currentTitle, with: self) {
                    print("ButtonsVC: action with object - \($0) and value - \($1 ?? "nil")")
                }
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with reference type object and sender")
            buttonPrimary("Action 12")
                .addActionWithSender(with: self) {
                    print("ButtonsVC: action with object - \($0) and sender - \($1)")
                }
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with value type object and sender (for methods consistency)")
            buttonPrimary("Action 13")
                .addActionWithSender(with: viewModel) {
                    print("ButtonsVC: action with object - \($0) and sender - \($1)")
                }
        }

        // MARK: Simple actions
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with value by keyPath")
            buttonPrimary("Action 14")
                .addAction(keyPath: \.currentTitle) {
                    print("ButtonsVC: action with value - \($0 ?? "nil")")
                }
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with sender")
            buttonPrimary("Action 15")
                .addActionWithSender {
                    print("ButtonsVC: action with sender - \($0)")
                }
        }
    }

    private lazy var stack = stack(.vertical, spacing: 32) {
        buttons
    }

    private lazy var scrollView = scrollView()

    // View controller

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    deinit {
        print("Deinit: \(self)")
    }
}

// MARK: - Private
private extension ButtonsViewController {
    func setup() {
        title = "Buttons"

        view.backgroundColor = .white

        scrollView.addSubview(stack, insets: .symmetry(h: 16, v: 32))
        view.addSubview(scrollView, insets: .zero)
        stack.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive(true)
    }

    func onButton() {
        print("ButtonsVC: onButton called")
    }

    func onButtonWithSender(_ sender: UIButton) {
        print("ButtonsVC: onButtonWithSender(:) called")
    }

    func onButtonWithValue(_ value: String?) {
        print("ButtonsVC: onButtonWithValue(\"\(value ?? "nil")\") called")
    }
}
