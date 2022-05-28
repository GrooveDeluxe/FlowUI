//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

extension UIView: AssociatedStore {}

public extension UIView {

    private struct AssociatedKeys {
        static var onTapAction = "onTapAction"
    }

    private typealias Action = (() -> Void)?

    private var onTapAction: Action? {
        get { return associatedObject(forKey: &AssociatedKeys.onTapAction, default: nil) }
        set { setAssociatedObject(newValue, forKey: &AssociatedKeys.onTapAction) }
    }

    @discardableResult
    func addTapGestureRecognizer(_ action: (() -> Void)?) -> Self {
        gestureRecognizers?.filter { $0 is UITapGestureRecognizer }.forEach { removeGestureRecognizer($0) }
        isUserInteractionEnabled = true
        onTapAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureAction))
        addGestureRecognizer(tapGestureRecognizer)
        return self
    }

    @objc fileprivate func handleTapGestureAction() {
        guard let action = onTapAction else { return }
        action?()
    }
}
