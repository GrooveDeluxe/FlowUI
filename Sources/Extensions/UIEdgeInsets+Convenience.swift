//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    static func all(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }

    static func symmetry(h: CGFloat, v: CGFloat) -> Self {
        UIEdgeInsets(top: v, left: h, bottom: v, right: h)
    }

    static func horizontal(_ h: CGFloat, top: CGFloat, bottom: CGFloat) -> Self {
        UIEdgeInsets(top: top, left: h, bottom: bottom, right: h)
    }

    static func vertical(_ v: CGFloat, left: CGFloat, right: CGFloat) -> Self {
        UIEdgeInsets(top: v, left: left, bottom: v, right: right)
    }

    @available(*, deprecated, message: "Use builder functions instead")
    func with(top: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil) -> Self {
        UIEdgeInsets(
            top: top ?? self.top,
            left: left ?? self.left,
            bottom: bottom ?? self.bottom,
            right: right ?? self.right
        )
    }

    func top(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: value, left: left, bottom: bottom, right: right)
    }

    func left(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: top, left: value, bottom: bottom, right: right)
    }

    func right(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: top, left: left, bottom: bottom, right: value)
    }

    func bottom(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: top, left: left, bottom: value, right: right)
    }

    func horizontal(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: top, left: value, bottom: bottom, right: value)
    }

    func vertical(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: value, left: left, bottom: value, right: right)
    }
}
