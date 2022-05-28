//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIButton {
    struct Style {
        let textColor: UIColor
        let font: UIFont
        let backgroundColor: UIColor
        let cornerRadius: CGFloat

        public init(textColor: UIColor, font: UIFont, backgroundColor: UIColor = .clear, cornerRadius: CGFloat = 0) {
            self.textColor = textColor
            self.font = font
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
        }
    }

    convenience init(title: String?, type: UIButton.ButtonType = .custom) {
        self.init(type: type)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
    }

    convenience init(image: UIImage?, type: UIButton.ButtonType = .custom) {
        self.init(type: type)
        translatesAutoresizingMaskIntoConstraints = false
        setImage(image, for: .normal)
    }

    @discardableResult
    func style(_ style: Style) -> Self {
        setTitleColor(style.textColor, for: .normal)
        titleLabel?.font = style.font
        backgroundColor = style.backgroundColor
        layer.cornerRadius = style.cornerRadius
        return self
    }

    @discardableResult
    func title(_ title: String) -> Self {
        setTitle(title, for: .normal)
        return self
    }

    @discardableResult
    func contentEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        contentEdgeInsets = insets
        return self
    }
}
