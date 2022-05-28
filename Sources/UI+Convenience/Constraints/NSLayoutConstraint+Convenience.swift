//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {
    @discardableResult
    func priority(_ value: UILayoutPriority) -> NSLayoutConstraint {
        priority = value
        return self
    }

    @discardableResult
    func isActive(_ value: Bool) -> NSLayoutConstraint {
        isActive = value
        return self
    }
}
