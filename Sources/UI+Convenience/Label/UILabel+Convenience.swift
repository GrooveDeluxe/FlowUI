//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public typealias Attributes = [NSAttributedString.Key: Any]

public extension UILabel {

    enum Attribute {
        case zeplin(lineHeight: CGFloat)
        case baselineOffset(CGFloat)
        case foregroundColor(_ color: UIColor)
        case backgroundColor(_ color: UIColor)
        case custom(Attributes)
    }

    struct Style {
        let font: UIFont
        let textColor: UIColor
        let textAlignment: NSTextAlignment
        let numberOfLines: Int
    }

    convenience init(text: String? = "",
                     font: UIFont? = nil,
                     textColor: UIColor? = nil,
                     textAlignment: NSTextAlignment = .left,
                     numberOfLines: Int = 0) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    @discardableResult
    func text(_ text: String?) -> UILabel {
        if attributedText != nil {
            guard let text = text else {
                self.attributedText = nil
                return self
            }
            self.attributedText = NSAttributedString(string: text)
        } else {
            self.text = text
        }
        return self
    }

    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> UILabel {
        self.attributedText = attributedText
        return self
    }

    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }

    @discardableResult
    func hideIfTextNilOrEmpty() -> Self {
        isHidden = (text ?? attributedText?.string)?.isEmpty ?? true
        return self
    }
    
    @discardableResult
    func adjustsFontSizeToFitWidth(_ needAdjusts: Bool) -> Self {
        adjustsFontSizeToFitWidth = needAdjusts
        return self
    }

    @discardableResult
    func apply(_ attributes: Attribute...) -> UILabel {
        var attributesAccum: Attributes = [:]
        attributes.forEach { attribute in
            switch attribute {
            case let .zeplin(lineHeight: lineHeight):
                attributesAccum += zeplinAttributes(lineHeight: lineHeight)
            default:
                attributesAccum += attribute.attributes
            }
        }

        guard let attributedString = attributedText?.mutableAttributed ?? text?.mutableAttributed else { return self }

        let range = NSRange(location: 0, length: attributedString.length)
        attributedString.addAttributes(attributesAccum, range: range)

        attributedText = attributedString

        return self
    }

    private func zeplinAttributes(lineHeight: CGFloat) -> Attributes {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight - font.lineHeight
        paragraphStyle.lineHeightMultiple = lineHeight / font.lineHeight
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.alignment = textAlignment
        return [.paragraphStyle: paragraphStyle]
    }
}

public extension UILabel.Attribute {
    var attributes: Attributes? {
        switch self {
        case .zeplin(lineHeight: _):
            // Потому что для вычисения нужен font. Вынесено в UILabel в zeplinAttributes
            return nil
        case let .baselineOffset(offset):
            return [.baselineOffset: offset]
        case let .foregroundColor(color):
            return [.foregroundColor: color]
        case let .backgroundColor(color):
            return [.backgroundColor: color]
        case let .custom(attributes):
            return attributes
        }
    }
}

public extension Attributes {
    static func + (lhs: Attributes, rhs: Attributes?) -> Attributes {
        var temp = lhs
        rhs?.forEach {
            temp[$0.key] = $0.value
        }
        return temp
    }

    static func += (lhs: inout Attributes, rhs: Attributes? = [:]) {
        // swiftlint:disable:next shorthand_operator
        lhs = lhs + rhs
    }
}
