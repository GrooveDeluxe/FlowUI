//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIView {
    @discardableResult
    func border(color: UIColor = .black, width: CGFloat = 1.0) -> Self {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        return self
    }
}
