//
//  Created by Dmitry Sochnev.
//  Copyright © 2023 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UITextField {
    convenience init(_ text: String?, placeholder: String? = nil) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.placeholder = placeholder
    }

    convenience init(_ string: NSAttributedString?,
                     defaultTextAttributes: [NSAttributedString.Key : Any] = [:],
                     attributedPlaceholder: NSAttributedString?,
                     typingAttributes: [NSAttributedString.Key : Any]? = nil) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.attributedText = string
        self.defaultTextAttributes = defaultTextAttributes
        self.attributedPlaceholder = attributedPlaceholder
        self.typingAttributes = typingAttributes
    }

    @discardableResult
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }

    @discardableResult
    func attributedText(_ string: NSAttributedString?) -> Self {
        attributedText = string
        return self
    }

    @discardableResult
    func textColor(_ color: UIColor?) -> Self {
        textColor = color
        return self
    }

    @discardableResult
    func font(_ font: UIFont?) -> Self {
        self.font = font
        return self
    }

    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        textAlignment = alignment
        return self
    }

    @discardableResult
    func borderStyle(_ style: UITextField.BorderStyle) -> Self {
        borderStyle = style
        return self
    }

    @discardableResult
    func defaultTextAttributes(_ attributes: [NSAttributedString.Key : Any]) -> Self {
        defaultTextAttributes = attributes
        return self
    }

    @discardableResult
    func placeholder(_ text: String?) -> Self {
        placeholder = text
        return self
    }

    @discardableResult
    func attributedPlaceholder(_ string: NSAttributedString?) -> Self {
        attributedPlaceholder = string
        return self
    }

    @discardableResult
    func clearsOnBeginEditing(_ value: Bool) -> Self {
        clearsOnBeginEditing = value
        return self
    }

    @discardableResult
    func adjustsFontSizeToFitWidth(_ value: Bool) -> Self {
        adjustsFontSizeToFitWidth = value
        return self
    }

    @discardableResult
    func minimumFontSize(_ value: CGFloat) -> Self {
        minimumFontSize = value
        return self
    }

    @discardableResult
    func delegate(_ delegate: UITextFieldDelegate?) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func background(_ image: UIImage?) -> Self {
        background = image
        return self
    }

    @discardableResult
    func disabledBackground(_ image: UIImage?) -> Self {
        disabledBackground = image
        return self
    }

    @discardableResult
    func allowsEditingTextAttributes(_ value: Bool) -> Self {
        allowsEditingTextAttributes = value
        return self
    }

    @discardableResult
    func typingAttributes(_ attributes: [NSAttributedString.Key : Any]?) -> Self {
        typingAttributes = attributes
        return self
    }

    @discardableResult
    func clearButtonMode(_ mode: UITextField.ViewMode) -> Self {
        clearButtonMode = mode
        return self
    }

    @discardableResult
    func leftView(_ view: UIView?) -> Self {
        leftView = view
        return self
    }

    @discardableResult
    func leftViewMode(_ mode: UITextField.ViewMode) -> Self {
        leftViewMode = mode
        return self
    }

    @discardableResult
    func rightView(_ view: UIView?) -> Self {
        rightView = view
        return self
    }

    @discardableResult
    func rightViewMode(_ mode: UITextField.ViewMode) -> Self {
        rightViewMode = mode
        return self
    }

    @discardableResult
    func inputView(_ view: UIView?) -> Self {
        inputView = view
        return self
    }

    @discardableResult
    func inputAccessoryView(_ view: UIView?) -> Self {
        inputAccessoryView = view
        return self
    }

    @discardableResult
    func clearsOnInsertion(_ value: Bool) -> Self {
        clearsOnInsertion = value
        return self
    }
}

// MARK: UITextField + UITextInputTraits

public extension UITextInputTraits where Self: UITextField {
    @discardableResult
    func autocapitalizationType(_ type: UITextAutocapitalizationType) -> Self {
        autocapitalizationType = type
        return self
    }

    @discardableResult
    func autocorrectionType(_ type: UITextAutocorrectionType) -> Self {
        autocorrectionType = type
        return self
    }

    @discardableResult
    func spellCheckingType(_ type: UITextSpellCheckingType) -> Self {
        spellCheckingType = type
        return self
    }

    @discardableResult
    func smartQuotesType(_ type: UITextSmartQuotesType) -> Self {
        smartQuotesType = type
        return self
    }

    @discardableResult
    func smartDashesType(_ type: UITextSmartDashesType) -> Self {
        smartDashesType = type
        return self
    }

    @discardableResult
    func smartInsertDeleteType(_ type: UITextSmartInsertDeleteType) -> Self {
        smartInsertDeleteType = type
        return self
    }

    @discardableResult
    func keyboardType(_ type: UIKeyboardType) -> Self {
        keyboardType = type
        return self
    }

    @discardableResult
    func keyboardAppearance(_ appearance: UIKeyboardAppearance) -> Self {
        keyboardAppearance = appearance
        return self
    }

    @discardableResult
    func returnKeyType(_ type: UIReturnKeyType) -> Self {
        returnKeyType = type
        return self
    }

    @discardableResult
    func enablesReturnKeyAutomatically( value: Bool) -> Self {
        enablesReturnKeyAutomatically = value
        return self
    }

    @discardableResult
    func isSecureTextEntry( value: Bool) -> Self {
        isSecureTextEntry = value
        return self
    }

    @discardableResult
    func textContentType(_ type: UITextContentType) -> Self {
        textContentType = type
        return self
    }

    @discardableResult
    func passwordRules(_ rules: UITextInputPasswordRules?) -> Self {
        passwordRules = rules
        return self
    }
}
