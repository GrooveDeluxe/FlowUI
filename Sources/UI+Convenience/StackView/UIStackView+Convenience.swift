//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIStackView {
    convenience init(_ axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat = 0,
                     distribution: UIStackView.Distribution = .fill,
                     alignment: UIStackView.Alignment = .fill,
                     @UIViewBuilder viewsBuilder: () -> [UIView]) {
        self.init(axis, spacing: spacing, distribution: distribution, alignment: alignment, views: viewsBuilder())
    }

    convenience init(_ axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat = 0,
                     distribution: UIStackView.Distribution = .fill,
                     alignment: UIStackView.Alignment = .fill,
                     views: [UIView] = []) {
        self.init(arrangedSubviews: views)
        self.spacing = spacing
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    func replaceArrangedSubviews(@UIViewBuilder arrangedSubviewsBuilder: () -> [UIView]) {
        removeAllArrangedSubviews()
        addArrangedSubviews(arrangedSubviewsBuilder())
    }

    func addArrangedSubviews(@UIViewBuilder arrangedSubviewsBuilder: () -> [UIView]) {
        addArrangedSubviews(arrangedSubviewsBuilder())
    }

    func addArrangedSubviews(_ arrangedSubviews: [UIView]) {
        arrangedSubviews.forEach { [weak self] in self?.addArrangedSubview($0) }
    }

    @discardableResult
    func isBaselineRelativeArrangement(_ value: Bool) -> Self {
        isBaselineRelativeArrangement = value
        return self
    }

    @discardableResult
    func isLayoutMarginsRelativeArrangement(_ value: Bool) -> Self {
        isLayoutMarginsRelativeArrangement = value
        return self
    }
}
