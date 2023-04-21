//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

extension UIControl.Event: Hashable {}

private typealias Action = () -> Void

private class ActionWrapper {
    let action: Action

    init(_ action: @escaping Action) {
        self.action = action
    }

    @objc func invoke() {
        action()
    }
}

public extension UIControl {
    private struct AssociatedKeys {
        static var actionWrappers = "actionWrappers"
    }

    private var actionWrappers: [Event: ActionWrapper] {
        get { return associatedObject(forKey: &AssociatedKeys.actionWrappers, default: [:]) }
        set { setAssociatedObject(newValue, forKey: &AssociatedKeys.actionWrappers) }
    }

    @available(*, deprecated, message: "Use addAction(for:action:) instead")
    @discardableResult
    func addTouchUpInside(_ action: (() -> Void)?) -> Self {
        guard let action else { return self }
        return addAction(for: .touchUpInside, action: action)
    }

    @discardableResult
    func addAction<T>(for event: UIControl.Event = .touchUpInside,
                      with object: T?,
                      do method: @escaping (T) -> () -> Void) -> Self {
        guard let object else { return self }
        return addAction(for: event) {
            method(object)()
        }
    }

    @discardableResult
    func addAction<T: AnyObject>(for event: UIControl.Event = .touchUpInside,
                                 with object: T?,
                                 action: @escaping (T) -> Void) -> Self {
        guard let object else { return self }
        return addAction(for: event) { [weak object] in
            guard let object else { return }
            action(object)
        }
    }

    @discardableResult
    func addAction<T>(for event: UIControl.Event = .touchUpInside,
                      with object: T?,
                      action: @escaping (T) -> Void) -> Self {
        guard let object else { return self }
        return addAction(for: event) {
            action(object)
        }
    }

    @discardableResult
    func addAction(for event: UIControl.Event = .touchUpInside, action: @escaping () -> Void) -> Self {
        if let actionWrapper = actionWrappers[event] {
            removeTarget(actionWrapper, action: nil, for: event)
            actionWrappers[event] = nil
        }
        let actionWrapper = ActionWrapper(action)
        addTarget(actionWrapper, action: #selector(ActionWrapper.invoke), for: event)
        actionWrappers[event] = actionWrapper
        return self
    }
}
