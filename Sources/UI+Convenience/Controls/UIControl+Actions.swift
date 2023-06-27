//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

extension UIControl.Event: Hashable {}

typealias Action = () -> Void

class ActionWrapper {
    let action: Action

    init(_ action: @escaping Action) {
        self.action = action
    }

    @objc func invoke() {
        action()
    }
}

public extension UIControl {
    struct AssociatedKeys {
        static var actionWrappers = "actionWrappers"
    }

    internal var actionWrappers: [Event: ActionWrapper] {
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

extension UIControl: ActionableControl {}

public protocol ActionableControl {}

// MARK: - Binding to object method -

public extension ActionableControl where Self: UIControl  {
    /// Binding action for event to object method (reference type object)
    @discardableResult
    func addAction<T: AnyObject>(for event: UIControl.Event = .touchUpInside,
                                 on object: T?,
                                 do method: @escaping (T) -> () -> Void) -> Self {
        addAction(for: event) { [weak object] in
            guard let object else { return }
            method(object)()
        }
    }

    /// Binding action for event to object method (value type object)
    @discardableResult
    func addAction<T>(for event: UIControl.Event = .touchUpInside,
                      on object: T?,
                      do method: @escaping (T) -> () -> Void) -> Self {
        addAction(for: event) {
            guard let object else { return }
            method(object)()
        }
    }
}

// MARK: - Binding to object method with control value by keyPath -

public extension ActionableControl where Self: UIControl  {
    /// Binding action for event to reference type object method with control's value by keyPath
    @discardableResult
    func addAction<T: AnyObject, V>(for event: UIControl.Event = .touchUpInside,
                                    keyPath: KeyPath<Self, V>,
                                    on object: T?,
                                    do method: @escaping (T) -> (V) -> Void) -> Self {
        addAction(for: event) { [weak self, weak object] in
            guard let self, let object else { return }
            method(object)(self[keyPath: keyPath])
        }
    }

    /// Binding action for event to value type object method with control's value by keyPath
    @discardableResult
    func addAction<T, V>(for event: UIControl.Event = .touchUpInside,
                         keyPath: KeyPath<Self, V>,
                         on object: T?,
                         do method: @escaping (T) -> (V) -> Void) -> Self {
        addAction(for: event) { [weak self] in
            guard let self, let object else { return }
            method(object)(self[keyPath: keyPath])
        }
    }
}

// MARK: - Binding to object method with sender -

public extension ActionableControl where Self: UIControl  {
    /// Binding action for event to reference type object method with sender
    @discardableResult
    func addActionWithSender<T: AnyObject>(for event: UIControl.Event = .touchUpInside,
                                           on object: T?,
                                           do method: @escaping (T) -> (Self) -> Void) -> Self {
        addAction(for: event) { [weak self, weak object] in
            guard let self, let object else { return }
            method(object)(self)
        }
    }

    /// Binding action for event to value type object method with sender
    @discardableResult
    func addActionWithSender<T>(for event: UIControl.Event = .touchUpInside,
                                on object: T?,
                                do method: @escaping (T) -> (Self) -> Void) -> Self {
        addAction(for: event) { [weak self] in
            guard let self, let object else { return }
            method(object)(self)
        }
    }
}

// MARK: - Binding of control value by keyPath to object's keyPath -

public extension ActionableControl where Self: UIControl  {
    /// Binding of control value by keyPath to object's keyPath
    @discardableResult
    func addAction<T: AnyObject, V>(for event: UIControl.Event = .touchUpInside,
                                    keyPath: KeyPath<Self, V>,
                                    on object: T?,
                                    to objectKeyPath: WritableKeyPath<T, V>) -> Self {
        addAction(for: event) { [weak self, weak object] in
            guard let self, var object else { return }
            object[keyPath: objectKeyPath] = self[keyPath: keyPath]
        }
    }
}

// MARK:  - Actions with object -

public extension ActionableControl where Self: UIControl  {
    /// Adding action for event with reference type unretained object
    @discardableResult
    func addAction<T: AnyObject>(for event: UIControl.Event = .touchUpInside,
                                 with object: T?,
                                 action: @escaping (T) -> Void) -> Self {
        addAction(for: event) { [weak object] in
            guard let object else { return }
            action(object)
        }
    }

    /// Adding action for event with value type object (for methods consistency)
    @discardableResult
    func addAction<T>(for event: UIControl.Event = .touchUpInside,
                      with object: T?,
                      action: @escaping (T) -> Void) -> Self {
        addAction(for: event) {
            guard let object else { return }
            action(object)
        }
    }

    /// Adding action for event with reference type unretained object and control's value by keyPath
    @discardableResult
    func addAction<T: AnyObject, V>(for event: UIControl.Event = .touchUpInside,
                                    keyPath: KeyPath<Self, V>,
                                    with object: T?,
                                    action: @escaping (T, V) -> Void) -> Self {
        addAction(for: event) { [weak self, weak object] in
            guard let self, let object else { return }
            action(object, self[keyPath: keyPath])
        }
    }

    /// Adding action for event with value type object and control's value by keyPath (for methods consistency)
    @discardableResult
    func addAction<T, V>(for event: UIControl.Event = .touchUpInside,
                         keyPath: KeyPath<Self, V>,
                         with object: T?,
                         action: @escaping (T, V) -> Void) -> Self {
        addAction(for: event) { [weak self] in
            guard let self, let object else { return }
            action(object, self[keyPath: keyPath])
        }
    }

    /// Adding action for event with reference type unretained object and sender
    @discardableResult
    func addActionWithSender<T: AnyObject>(for event: UIControl.Event = .touchUpInside,
                                           with object: T?,
                                           action: @escaping (T, Self) -> Void) -> Self {
        addAction(for: event) { [weak self, weak object] in
            guard let self, let object else { return }
            action(object, self)
        }
    }

    /// Adding action for event with value type object and sender (for methods consistency)
    @discardableResult
    func addActionWithSender<T>(for event: UIControl.Event = .touchUpInside,
                                with object: T?,
                                action: @escaping (T, Self) -> Void) -> Self {
        addAction(for: event) { [weak self] in
            guard let self, let object else { return }
            action(object, self)
        }
    }
}

// MARK: - Simple actions -

public extension ActionableControl where Self: UIControl  {
    /// Adding action for event with control's value by keyPath
    @discardableResult
    func addAction<V>(for event: UIControl.Event = .touchUpInside,
                      keyPath: KeyPath<Self, V>,
                      action: @escaping (V) -> Void) -> Self {
        addAction(for: event) { [weak self] in
            guard let self else { return }
            action(self[keyPath: keyPath])
        }
    }

    /// Adding action for event with sender
    @discardableResult
    func addActionWithSender(for event: UIControl.Event = .touchUpInside,
                             action: @escaping (Self) -> Void) -> Self {
        addAction(for: event) { [weak self] in
            guard let self else { return }
            action(self)
        }
    }
}
