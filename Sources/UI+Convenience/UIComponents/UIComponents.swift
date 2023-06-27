//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public protocol UIComponents {}

public extension UIComponents {

    // MARK: Sctoll View

    func scrollView(contentInsets: UIEdgeInsets = .zero,
                    contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior = .automatic) -> UIScrollView {
        UIScrollView(contentInsets: contentInsets, contentInsetAdjustmentBehavior: contentInsetAdjustmentBehavior)
    }

    // MARK: Stack

    func stack(_ axis: NSLayoutConstraint.Axis,
               spacing: CGFloat = 0,
               distribution: UIStackView.Distribution = .fill,
               alignment: UIStackView.Alignment = .fill,
               @UIViewBuilder viewsBuilder: () -> [UIView]) -> UIStackView {
        UIStackView(
            axis,
            spacing: spacing,
            distribution: distribution,
            alignment: alignment,
            viewsBuilder: viewsBuilder
        )
    }

    // MARK: Label

    func label(_ text: String? = "",
               font: UIFont? = nil,
               textColor: UIColor? = nil,
               textAlignment: NSTextAlignment = .natural,
               numberOfLines: Int = 0) -> UILabel {
        UILabel(
            text: text,
            font: font,
            textColor: textColor,
            textAlignment: textAlignment,
            numberOfLines: numberOfLines
        )
    }

    func label(_ attributedText: NSAttributedString? = nil,
               numberOfLines: Int = 0) -> UILabel {
        UILabel(attributedText: attributedText, numberOfLines: numberOfLines)
    }

    // MARK: Button

    func button(_ title: String? = nil,
                size: CGSize? = nil,
                type: UIButton.ButtonType = .custom) -> UIButton {
        UIButton(title, type: type)
            .size(width: size?.width, height: size?.height)
    }

    func button(_ attributedTitle: NSAttributedString?,
                size: CGSize? = nil,
                type: UIButton.ButtonType = .custom) -> UIButton {
        UIButton(attributedTitle, type: type)
            .size(width: size?.width, height: size?.height)
    }

    func button(_ image: UIImage?, size: CGSize? = nil, type: UIButton.ButtonType = .custom) -> UIButton {
        UIButton(image, type: type)
            .size(width: size?.width, height: size?.height)
    }

    @available(*, deprecated, message: "Use component without title of first parameter instead")
    func button(title: String,
                size: CGSize? = nil,
                type: UIButton.ButtonType = .custom) -> UIButton {
        UIButton(title: title, type: type)
            .size(width: size?.width, height: size?.height)
    }

    @available(*, deprecated, message: "Use component without title of first parameter instead")
    func button(attributedTitle: NSAttributedString?,
                size: CGSize? = nil,
                type: UIButton.ButtonType = .custom) -> UIButton {
        UIButton(attributedTitle: attributedTitle, type: type)
            .size(width: size?.width, height: size?.height)
    }

    @available(*, deprecated, message: "Use component without title of first parameter instead")
    func button(image: UIImage?, size: CGSize? = nil, type: UIButton.ButtonType = .custom) -> UIButton {
        UIButton(image: image, type: type)
            .size(width: size?.width, height: size?.height)
    }

    // MARK: Image View

    func imageView(_ image: UIImage? = nil, size: UIImageView.SizeType = .byImage) -> UIImageView {
        UIImageView(image, size: size)
    }

    @available(*, deprecated, message: "Use 'imageView(_:size:) and contentMode(_:) instead")
    func imageView(image: UIImage? = nil,
                   contentMode: UIView.ContentMode = .scaleToFill,
                   size: UIImageView.SizeType = .byImage) -> UIImageView {
        UIImageView(image, size: size)
            .contentMode(contentMode)
    }

    func imageView(_ image: UIImage? = nil, size: CGSize) -> UIImageView {
        UIImageView(image, size: size)
    }

    @available(*, deprecated, message: "Use 'imageView(_:size:) and contentMode(_:) instead")
    func imageView(image: UIImage? = nil,
                   contentMode: UIView.ContentMode = .scaleToFill,
                   size: CGSize) -> UIImageView {
        UIImageView(image, size: size)
            .contentMode(contentMode)
    }

    // MARK: View

    func space(width: CGFloat? = nil, height: CGFloat? = nil) -> UIView {
        UIView(color: .clear, width: width, height: height)
    }

    func flexibleSpace() -> UIView {
        space()
            .contentHuggingPriority(.defaultLow, for: .horizontal)
            .contentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            .contentHuggingPriority(.defaultLow, for: .vertical)
            .contentCompressionResistancePriority(.defaultHigh, for: .vertical)
    }

    func container(color: UIColor = .clear,
                   width: CGFloat? = nil,
                   height: CGFloat? = nil,
                   configure: ((UIView) -> Void)? = nil) -> UIView {
        let view = UIView(color: color, width: width, height: height)
        configure?(view)
        return view
    }

    func container(color: UIColor = .clear,
                   size: CGSize,
                   configure: ((UIView) -> Void)? = nil) -> UIView {
        let view = UIView(color: color, size: size)
        configure?(view)
        return view
    }

    // MARK: Activity Indicator

    func activityIndicator(_ style: UIActivityIndicatorView.Style,
                           color: UIColor = .gray,
                           hidesWhenStopped: Bool = true) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style, color: color, hidesWhenStopped: hidesWhenStopped)
    }

    // MARK: Switcher

    func switcher(isOn: Bool = false) -> UISwitch {
        UISwitch(isOn: isOn)
    }

    // MARK: Slider

    func slider(range: ClosedRange<Float>, value: Float = 0.0) -> UISlider {
        UISlider(range: range, value: value)
    }

    // MARK: Stepper

    func stepper(range: ClosedRange<Double>, step: Double, value: Double = 0.0) -> UIStepper {
        UIStepper(range: range, step: step, value: value)
    }

    // MARK: Page Control

    func pageControl(numberOfPages: Int, currentPage: Int) -> UIPageControl {
        UIPageControl(numberOfPages: numberOfPages, currentPage: currentPage)
    }

    // MARK: Text Field

    func textField(_ text: String? = nil, placeholder: String? = nil) -> UITextField {
        UITextField(text, placeholder: placeholder)
    }

    func textField(_ string: NSAttributedString?,
                   defaultTextAttributes: [NSAttributedString.Key : Any] = [:],
                   attributedPlaceholder: NSAttributedString?,
                   typingAttributes: [NSAttributedString.Key : Any]? = nil) -> UITextField {
        UITextField(
            string,
            defaultTextAttributes: defaultTextAttributes,
            attributedPlaceholder: attributedPlaceholder,
            typingAttributes: typingAttributes
        )
    }

    // MARK: Date Picker

    func datePicker(mode: UIDatePicker.Mode = .dateAndTime,
                    date: Date = Date(),
                    in range: ClosedRange<Date>? = nil) -> UIDatePicker {
        UIDatePicker(mode: mode, date: date, in: range)
    }

    func datePicker(mode: UIDatePicker.Mode = .dateAndTime,
                    date: Date = Date(),
                    in range: PartialRangeFrom<Date>? = nil) -> UIDatePicker {
        UIDatePicker(mode: mode, date: date, in: range)
    }

    func datePicker(mode: UIDatePicker.Mode = .dateAndTime,
                    date: Date = Date(),
                    in range: PartialRangeThrough<Date>? = nil) -> UIDatePicker {
        UIDatePicker(mode: mode, date: date, in: range)
    }
}
