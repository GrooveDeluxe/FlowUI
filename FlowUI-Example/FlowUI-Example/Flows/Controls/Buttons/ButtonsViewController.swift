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

        // MARK: Actions with object
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with reference type object (unretained)")
            buttonPrimary("Action 7")
                .addAction(with: self) {
                    print("ControlsVC: action with object - \($0)")
                }
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with value type object (for methods consistency)")
            buttonPrimary("Action 8")
                .addAction(with: viewModel) {
                    print("ControlsVC: action with object - \($0)")
                }
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with reference type object and control's value by keyPath")
            buttonPrimary("Action 9")
                .addAction(keyPath: \.currentTitle, with: self) {
                    print("ControlsVC: action with object - \($0) and value - \($1 ?? "nil")")
                }
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle,
                  text: "Action with value type object and control's value by keyPath (for methods consistency)")
            buttonPrimary("Action 10")
                .addAction(keyPath: \.currentTitle, with: self) {
                    print("ControlsVC: action with object - \($0) and value - \($1 ?? "nil")")
                }
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with reference type object and sender")
            buttonPrimary("Action 11")
                .addActionWithSender(with: self) {
                    print("ControlsVC: action with object - \($0) and sender - \($1)")
                }
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with value type object and sender")
            buttonPrimary("Action 12")
                .addActionWithSender(with: viewModel) {
                    print("ControlsVC: action with object - \($0) and sender - \($1)")
                }
        }

        // MARK: Simple actions
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with value by keyPath")
            buttonPrimary("Action 13")
                .addAction(keyPath: \.currentTitle) {
                    print("ControlsVC: action with value - \($0 ?? "nil")")
                }
        }

        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Action with sender")
            buttonPrimary("Action 14")
                .addActionWithSender {
                    print("ControlsVC: action with sender - \($0)")
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
        print("ControlsVC: onButton called")
    }

    func onButtonWithSender(_ sender: UIButton) {
        print("ControlsVC: onButtonWithSender(:) called")
    }

    func onButtonWithValue(_ value: String?) {
        print("ControlsVC: onButtonWithValue(\"\(value ?? "nil")\") called")
    }
}
