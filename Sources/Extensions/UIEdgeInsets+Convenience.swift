//
//  Created by Dmitry Sochnev.
//  
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

    func with(top: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil) -> Self {
        UIEdgeInsets(
            top: top ?? self.top,
            left: left ?? self.left,
            bottom: bottom ?? self.bottom,
            right: right ?? self.right
        )
    }
}
