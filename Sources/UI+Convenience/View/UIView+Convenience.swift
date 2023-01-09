//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIView {
    convenience init(color: UIColor = .clear, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.init()
        self.backgroundColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
        size(width: width, height: height)
    }

    convenience init(color: UIColor = .clear, size: CGSize) {
        self.init()
        self.backgroundColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
        self.size(size)
    }

    func addSubview(_ subview: UIView, insets: UIEdgeInsets) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
            subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
            subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.right),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom)
        ])
    }

    func addSubview(_ subview: UIView, pinnedTo edges: Edge...) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        subview.pinTo(self, edges: edges)
    }

    func addSubview(_ subview: UIView, pinnedTo edges: [Edge]) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        subview.pinTo(self, edges: edges)
    }
    
    func wrappedInContainer(insets: UIEdgeInsets = .zero) -> UIView {
        let container = UIView()
        container.addSubview(self, insets: insets)
        return container
    }

    func wrappedInContainer(pinnedTo edges: Edge...) -> UIView {
        let container = UIView()
        container.addSubview(self, pinnedTo: edges)
        return container
    }

    @discardableResult
    func size(_ size: CGSize) -> Self {
        self.size(width: size.width, height: size.height)
        return self
    }

    @discardableResult
    func size(width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
        translatesAutoresizingMaskIntoConstraints(false)
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        return self
    }

    @discardableResult
    func translatesAutoresizingMaskIntoConstraints(_ translates: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = translates
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ enabled: Bool) -> Self {
        isUserInteractionEnabled = enabled
        return self
    }

    @discardableResult
    func backgroundColor(_ color: UIColor?) -> Self {
        backgroundColor = color
        return self
    }

    @discardableResult
    func cornerRadius(_ radius: CGFloat = defaultCornerRadius) -> Self {
        layer.cornerRadius = radius
        return self
    }

    @discardableResult
    func isHidden(_ value: Bool) -> Self {
        isHidden = value
        return self
    }
    
    @discardableResult
    func clipsToBounds(_ clips: Bool = true) -> Self {
        clipsToBounds = clips
        return self
    }

    @discardableResult
    func contentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        setContentHuggingPriority(priority, for: axis)
        return self
    }

    @discardableResult
    func contentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        setContentCompressionResistancePriority(priority, for: axis)
        return self
    }

    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode
        return self
    }

    @discardableResult
    func tintColor(_ color: UIColor) -> Self {
        tintColor = color
        return self
    }

    @discardableResult
    func mask(_ maskView: UIView?) -> Self {
        mask = maskView
        return self
    }

    @discardableResult
    func tintAdjustmentMode(_ mode: UIView.TintAdjustmentMode) -> Self {
        tintAdjustmentMode = mode
        return self
    }

    @discardableResult
    func layoutMargins(_ value: UIEdgeInsets) -> Self {
        layoutMargins = value
        return self
    }

    @discardableResult
    func directionalLayoutMargins(_ value: NSDirectionalEdgeInsets) -> Self {
        directionalLayoutMargins = value
        return self
    }

    @discardableResult
    func preservesSuperviewLayoutMargins(_ value: Bool) -> Self {
        preservesSuperviewLayoutMargins = value
        return self
    }

    @discardableResult
    func insetsLayoutMarginsFromSafeArea(_ value: Bool) -> Self {
        insetsLayoutMarginsFromSafeArea = value
        return self
    }
}

public protocol Configurable {}

public extension Configurable {
    @discardableResult
    func configure(_ configure: (Self) -> Void) -> Self {
        configure(self)
        return self
    }
}
