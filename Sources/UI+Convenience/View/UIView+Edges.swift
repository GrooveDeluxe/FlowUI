//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIView {
    struct Edge {
        public enum EdgeKind: Equatable {
            case top
            case left
            case right
            case bottom
            case centerX
            case centerY

            var attribute: NSLayoutConstraint.Attribute {
                let map: [Self: NSLayoutConstraint.Attribute] = [
                    .top: .top,
                    .left: .left,
                    .right: .right,
                    .bottom: .bottom,
                    .centerX: .centerX,
                    .centerY: .centerY
                ]
                return map[self] ?? .notAnAttribute
            }
        }

        public let kind: EdgeKind
        public let relation: NSLayoutConstraint.Relation
        public let constant: CGFloat
        public let priority: UILayoutPriority
        public let layoutGuide: KeyPath<UIView, UILayoutGuide>?

        private init(_ kind: EdgeKind,
                     relation: NSLayoutConstraint.Relation = .equal,
                     constant: CGFloat = 0.0,
                     priority: UILayoutPriority = .required,
                     layoutGuide: KeyPath<UIView, UILayoutGuide>? = nil) {
            self.kind = kind
            self.relation = relation
            self.constant = constant
            self.priority = priority
            self.layoutGuide = layoutGuide
        }

        public static let top = Edge(.top)
        public static let left = Edge(.left)
        public static let right = Edge(.right)
        public static let bottom = Edge(.bottom)
        public static let centerX = Edge(.centerX)
        public static let centerY = Edge(.centerY)

        public static func top(_ value: CGFloat) -> Edge {
            Edge(.top, constant: value)
        }

        public static func left(_ value: CGFloat) -> Edge {
            Edge(.left, constant: value)
        }

        public static func right(_ value: CGFloat) -> Edge {
            Edge(.right, constant: value)
        }

        public static func bottom(_ value: CGFloat) -> Edge {
            Edge(.bottom, constant: value)
        }

        public static func centerX(_ value: CGFloat) -> Edge {
            Edge(.centerX, constant: value)
        }

        public static func centerY(_ value: CGFloat) -> Edge {
            Edge(.centerY, constant: value)
        }

        public func relation(_ value: NSLayoutConstraint.Relation) -> Self {
            Edge(kind, relation: value, constant: constant, priority: priority)
        }

        public func constant(_ value: CGFloat) -> Self {
            Edge(kind, relation: relation, constant: value, priority: priority)
        }

        public func priority(_ value: UILayoutPriority) -> Self {
            Edge(kind, relation: relation, constant: constant, priority: value)
        }

        public var safeArea: Self {
            Edge(kind, relation: relation, constant: constant, priority: priority, layoutGuide: \.safeAreaLayoutGuide)
        }
    }

    @discardableResult
    func pinTo(_ view: UIView, edges: Edge...) -> Self {
        edges.forEach { edge in
            pinTo(view, edge: edge)
        }
        return self
    }

    @discardableResult
    func pinTo(_ view: UIView, edges: [Edge]) -> Self {
        edges.forEach { edge in
            pinTo(view, edge: edge)
        }
        return self
    }

    private func pinTo(_ view: UIView, edge: Edge) {
        var toItem: Any? = view
        if let layoutGuide = edge.layoutGuide {
            toItem = view[keyPath: layoutGuide]
        }
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: edge.kind.attribute,
            relatedBy: edge.relation,
            toItem: toItem,
            attribute: edge.kind.attribute,
            multiplier: 1.0,
            constant: (edge.kind == .right || edge.kind == .bottom) ? -edge.constant : edge.constant
        )
        constraint.priority(edge.priority).isActive(true)
    }
}

public extension Array where Element == UIView.Edge {
    var top: CGFloat? { first { $0.kind == .top }?.constant }
    var left: CGFloat? { first { $0.kind == .left }?.constant }
    var right: CGFloat? { first { $0.kind == .right }?.constant }
    var bottom: CGFloat? { first { $0.kind == .bottom }?.constant }
    var centerX: CGFloat? { first { $0.kind == .centerX }?.constant }
    var centerY: CGFloat? { first { $0.kind == .centerY }?.constant }
}
