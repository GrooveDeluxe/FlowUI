//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIView {
    struct ShadowStyle {
        let color: UIColor
        let offset: CGSize
        let blur: CGFloat
        let spread: CGFloat

        init(color: UIColor = .black,
             x: CGFloat = 0,
             y: CGFloat = UIView.defaultShadowOffsetY,
             blur: CGFloat = UIView.defaultShadowBlur,
             spread: CGFloat = 0) {
            self.color = color
            self.offset = CGSize(width: x, height: y)
            self.blur = blur
            self.spread = spread
        }
    }

    @discardableResult
    func shadow(_ style: ShadowStyle) -> Self {
        shadow(color: style.color, offset: style.offset, blur: style.blur, spread: style.spread)
    }

    @discardableResult
    func shadow(color: UIColor = .black,
                x: CGFloat = 0,
                y: CGFloat = 0,
                blur: CGFloat = 0,
                spread: CGFloat = 0) -> Self {
        shadow(color: color, offset: CGSize(width: x, height: y), blur: blur, spread: spread)
    }

    @discardableResult
    func shadow(color: UIColor = .black,
                offset: CGSize = CGSize(width: 0, height: defaultShadowOffsetY),
                blur: CGFloat = defaultShadowBlur,
                spread: CGFloat = 0) -> Self {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = offset
        layer.shadowRadius = blur / 2
        if spread == 0 {
            layer.shadowPath = nil
        } else {
            let rect = bounds.insetBy(dx: -spread, dy: -spread)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
        return self
    }
}
