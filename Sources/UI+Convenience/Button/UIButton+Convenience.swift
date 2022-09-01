//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIButton {
    struct Style {
        public enum Item {
            case font(UIFont)
            case foregroundColor(UIColor)
            case backgroundColor(UIColor)
            case cornerRadius(CGFloat)
        }

        let styleItems: [Item]

        public init(_ styleItems: Item...) {
            self.styleItems = styleItems
        }
    }

    convenience init(title: String?, type: UIButton.ButtonType = .custom) {
        self.init(type: type)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
    }

    convenience init(attributedTitle: NSAttributedString?, type: UIButton.ButtonType = .custom) {
        self.init(type: type)
        translatesAutoresizingMaskIntoConstraints = false
        setAttributedTitle(attributedTitle, for: .normal)
    }

    convenience init(image: UIImage?, type: UIButton.ButtonType = .custom) {
        self.init(type: type)
        translatesAutoresizingMaskIntoConstraints = false
        setImage(image, for: .normal)
    }

    @discardableResult
    func style(_ style: Style) -> Self {
        style.styleItems.forEach {
            switch $0 {
            case .font(let font):
                titleLabel?.font = font
            case .foregroundColor(let color):
                setTitleColor(color, for: .normal)
            case .backgroundColor(let color):
                backgroundColor = color
            case .cornerRadius(let radius):
                layer.cornerRadius = radius
            }
        }
        return self
    }

    @discardableResult
    func tintColor(_ tintColor: UIColor) -> Self {
        self.tintColor = tintColor
        return self
    }

    @discardableResult
    func title(_ title: String?, for state: UIControl.State = .normal) -> Self {
        setTitle(title, for: state)
        return self
    }

    @discardableResult
    func titleColor(_ color: UIColor?, for state: UIControl.State = .normal) -> Self {
        setTitleColor(color, for: state)
        return self
    }

    @discardableResult
    func titleShadowColor(_ color: UIColor?, for state: UIControl.State = .normal) -> Self {
        setTitleShadowColor(color, for: state)
        return self
    }

    @discardableResult
    func image(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        setImage(image, for: state)
        return self
    }

    @discardableResult
    func backgroundImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }

    @discardableResult
    func attributedTitle(_ title: NSAttributedString?, for state: UIControl.State = .normal) -> Self {
        setAttributedTitle(title, for: state)
        return self
    }

    @discardableResult
    func contentEdgeInsets(_ contentEdgeInsets: UIEdgeInsets) -> Self {
        self.contentEdgeInsets = contentEdgeInsets
        return self
    }

    @discardableResult
    func titleEdgeInsets(_ titleEdgeInsets: UIEdgeInsets) -> Self {
        self.titleEdgeInsets = titleEdgeInsets
        return self
    }

    @discardableResult
    func imageEdgeInsets(_ imageEdgeInsets: UIEdgeInsets) -> Self {
        self.imageEdgeInsets = imageEdgeInsets
        return self
    }

    @discardableResult
    func reversesTitleShadowWhenHighlighted(_ reversesTitleShadowWhenHighlighted: Bool) -> Self {
        self.reversesTitleShadowWhenHighlighted = reversesTitleShadowWhenHighlighted
        return self
    }

    @discardableResult
    func adjustsImageWhenHighlighted(_ adjustsImageWhenHighlighted: Bool) -> Self {
        self.adjustsImageWhenHighlighted = adjustsImageWhenHighlighted
        return self
    }

    @discardableResult
    func adjustsImageWhenDisabled(_ adjustsImageWhenDisabled: Bool) -> Self {
        self.adjustsImageWhenDisabled = adjustsImageWhenDisabled
        return self
    }


    @discardableResult
    func showsTouchWhenHighlighted(_ showsTouchWhenHighlighted: Bool) -> Self {
        self.showsTouchWhenHighlighted = showsTouchWhenHighlighted
        return self
    }
}
