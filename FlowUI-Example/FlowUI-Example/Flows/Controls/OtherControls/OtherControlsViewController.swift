//
//  Created by Dmitry Sochnev.
//  Copyright © 2023 Dmitry Sochnev. All rights reserved.
//

import UIKit
import FlowUI

final class OtherControlsViewController: UIViewController {

    typealias VC = OtherControlsViewController

    // Data

    private let textFieldTextAttributes: [NSAttributedString.Key : Any] = [
        .font: UIFont.systemFont(ofSize: 17, weight: .bold),
        .foregroundColor: UIColor.cyan
    ]
    private let textFieldtypingAttributes: [NSAttributedString.Key : Any] = [
        .font: UIFont.systemFont(ofSize: 20, weight: .heavy),
        .foregroundColor: UIColor.red
    ]

    private lazy var attributedText: NSAttributedString = {
        NSAttributedString(
            string: "Some Text",
            attributes: textFieldTextAttributes
        )
    }()

    private lazy var attributedPlaceholder: NSAttributedString = {
        NSAttributedString(
            string: "Placeholder",
            attributes: [
                .font: UIFont.systemFont(ofSize: 17, weight: .regular),
                .foregroundColor: UIColor.blue
            ]
        )
    }()

    // UI components

    @UIViewBuilder private var controls: [UIView] {
        // MARK: Switcher
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Switch")
            switcher()
                .addAction(for: .valueChanged, keyPath: \.isOn, on: self, do: VC.onSwitcher)
        }

        // MARK: Slider
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Slider")
            slider(range: -10...10)
                .addAction(for: .valueChanged, keyPath: \.value, on: self, do: VC.onSlider)
        }

        // MARK: Stepper
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Stepper")
            stepper(range: 0...15, step: 1.5)
                .addAction(for: .valueChanged, keyPath: \.value, on: self, do: VC.onStepper)
        }

        // MARK: PageControl
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Page Control")
            pageControl(numberOfPages: 10, currentPage: 0)
                .configure {
                    if #available(iOS 14.0, *) {
                        $0.backgroundStyle(.prominent)
                      } else {
                          // Fallback on earlier versions
                      }
                }
                .addAction(for: .valueChanged, keyPath: \.currentPage, on: self, do: VC.onPageControl)
        }

        // MARK: TextFiled
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Text Field")
            textField("Some text", placeholder: "Placeholder")
                .addAction(for: .editingChanged, keyPath: \.text, on: self, do: VC.onTextField)
        }

        // MARK: TextField (attributed)
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Text Field (attributed)")
            textField(
                attributedText,
                defaultTextAttributes: textFieldTextAttributes,
                attributedPlaceholder: attributedPlaceholder,
                typingAttributes: textFieldtypingAttributes
            )
            .addAction(for: .editingChanged, keyPath: \.text, on: self, do: VC.onTextFieldAttributed)
        }

        // MARK: TextFiled (with sender)
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Text Field (sender)")
            textField(placeholder: "Placeholder")
                .autocapitalizationType(.words)
                .addAction(for: .editingDidBegin, on: self, do: VC.onTextFieldEditingBegin)
                .addAction(for: .editingDidEnd, on: self, do: VC.onTextFieldEditingEnd)
                .addActionWithSender(for: .editingChanged, on: self, do: VC.onTextFieldWithSender)
        }

        // MARK: DatePicker
        stack(.vertical, spacing: 8) {
            label(.subtitle, text: "Date Picker")
            UIDatePicker(mode: .date)
                .addAction(for: .valueChanged, keyPath: \.date, on: self, do: VC.onDatePicker)
        }
    }

    private lazy var stack = stack(.vertical, spacing: 32) {
        controls
        space(height: 400)
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
private extension OtherControlsViewController {
    func setup() {
        title = "Other controls"

        view.backgroundColor = .white

        scrollView.keyboardDismissMode = .onDrag

        scrollView.addSubview(stack, insets: .symmetry(h: 16, v: 32))
        view.addSubview(scrollView, insets: .zero)
        stack.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive(true)
    }

    func onSwitcher(_ value: Bool) {
        print("OtherControlsVC: onSwitcher(\"\(value)\") called")
    }

    func onSlider(_ value: Float) {
        print("OtherControlsVC: onSlider(\"\(value)\") called")
    }

    func onStepper(_ value: Double) {
        print("OtherControlsVC: onStepper(\"\(value)\") called")
    }

    func onPageControl(_ currentPage: Int) {
        print("OtherControlsVC: onPageControl(\"\(currentPage)\") called")
    }

    func onTextField(_ text: String?) {
        print("OtherControlsVC: onTextField(\"\(text ?? "---")\") called")
    }

    func onTextFieldAttributed(_ text: String?) {
        print("OtherControlsVC: onTextFieldAttributed(\"\(text ?? "---")\") called")
    }

    func onTextFieldEditingBegin() {
        print("OtherControlsVC: onTextFieldEditingBegin called")
    }

    func onTextFieldEditingEnd() {
        print("OtherControlsVC: onTextFieldEditingEnd called")
    }

    func onTextFieldWithSender(_ textField: UITextField) {
        print("OtherControlsVC: onTextFieldWithSender(\"\(textField)\") called")
    }

    func onDatePicker(_ date: Date) {
        print("OtherControlsVC: onDatePicker(\"\(date)\") called")
    }
}
