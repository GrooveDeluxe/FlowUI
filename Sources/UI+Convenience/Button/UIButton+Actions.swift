//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIButton {

    private struct AssociatedKeys {
        static var touchUpInside = "touchUpInside"
    }

    private typealias Action = (() -> Void)?

    private var touchUpInsideAction: Action? {
        get { return associatedObject(forKey: &AssociatedKeys.touchUpInside, default: nil) }
        set { setAssociatedObject(newValue, forKey: &AssociatedKeys.touchUpInside) }
    }

    @discardableResult
    func addTouchUpInside(_ action: (() -> Void)?) -> Self {
        removeTarget(self, action: nil, for: .touchUpInside)
        touchUpInsideAction = action
        addTarget(self, action: #selector(handleTouchUpInsideAction), for: .touchUpInside)
        return self
    }

    @objc fileprivate func handleTouchUpInsideAction() {
        guard let action = touchUpInsideAction else { return }
        action?()
    }
}
