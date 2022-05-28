//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIView {
    enum Relation {
        case equal
        case lessOrEqual
        case greaterOrEqual
    }

    indirect enum Edge: Equatable {
        case top(CGFloat)
        case left(CGFloat)
        case right(CGFloat)
        case bottom(CGFloat)
        case centerX(CGFloat)
        case centerY(CGFloat)
        
        case multiplier(CGFloat, edge: Self)
        case relation(Relation, edge: Self)
        
        static let top = Self.top(0)
        static var left = Self.left(0)
        static var right = Self.right(0)
        static var bottom  = Self.bottom(0)
        static var centerX  = Self.centerX(0)
        static var centerY  = Self.centerY(0)
        
        var value: CGFloat {
            switch self {
            case .top(let value),
                 .left(let value),
                 .right(let value),
                 .bottom(let value),
                 .centerX(let value),
                 .centerY(let value):
                return value
            default:
                return 0.0
            }
        }
        /// Сравнивает типы Edge не учитывая ассоциированные значения.
        func isEdge(_ edge: Edge) -> Bool {
            switch self {
            case .top(_):
                return edge == .top
            case .left(_):
                return edge == .left
            case .right(_):
                return edge == .right
            case .bottom(_):
                return edge == .bottom
            case .centerX(_):
                return edge == .centerX
            case .centerY(_):
                return edge == .centerY
            default:
                return false
            }
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
        switch edge {
        case .top(let constant):
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
        case .left(let constant):
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant).isActive = true
        case .right(let constant):
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -constant).isActive = true
        case .bottom(let constant):
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
        case .centerX(let constant):
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
        case .centerY(let constant):
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        case .multiplier(let multiplier, edge: let edge):
            pinTo(view, edge: edge, multiplier: multiplier)
        case .relation(let relation, edge: let edge):
            pinTo(view, edge: edge, relation: relation)
        }
    }

    private func pinTo(_ view: UIView, edge: Edge, multiplier: CGFloat) {
        switch edge {
        case .top:
            topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor,
                                 multiplier: multiplier).isActive = true
        case .left:
            leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor,
                                  multiplier: multiplier).isActive = true
        case .right:
            rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor,
                                   multiplier: multiplier).isActive = true
        case .bottom:
            bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor,
                                    multiplier: multiplier).isActive = true
        case .centerX:
            centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor,
                                     multiplier: multiplier).isActive = true
        case .centerY:
            centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor,
                                     multiplier: multiplier).isActive = true
        case .multiplier(_, edge: _):
            fatalError("Can't be multiplier with multiplier")
        case .relation(_, edge: _):
            fatalError("Can't be relation with relation")
        }
    }

    private func pinTo(_ view: UIView, edge: Edge, relation: Relation) {
        switch relation {
        case .equal:
            fatalError("Use without relation")
        case .lessOrEqual:
            switch edge {
            case .top(let constant):
                topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: constant).isActive = true
            case .left(let constant):
                leftAnchor.constraint(lessThanOrEqualTo: view.leftAnchor, constant: constant).isActive = true
            case .right(let constant):
                rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor, constant: -constant).isActive = true
            case .bottom(let constant):
                bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -constant).isActive = true
            case .centerX(let constant):
                centerXAnchor.constraint(lessThanOrEqualTo: view.centerXAnchor, constant: constant).isActive = true
            case .centerY(let constant):
                centerYAnchor.constraint(lessThanOrEqualTo: view.centerYAnchor, constant: constant).isActive = true
            case .multiplier(_, edge: _):
                fatalError("Can't be multiplier with relation")
            case .relation(_, edge: _):
                fatalError("Can't be relation with relation")
            }
        case .greaterOrEqual:
            switch edge {
            case .top(let constant):
                topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: constant).isActive = true
            case .left(let constant):
                leftAnchor.constraint(greaterThanOrEqualTo: view.leftAnchor, constant: constant).isActive = true
            case .right(let constant):
                rightAnchor.constraint(greaterThanOrEqualTo: view.rightAnchor, constant: -constant).isActive = true
            case .bottom(let constant):
                bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: -constant).isActive = true
            case .centerX(let constant):
                centerXAnchor.constraint(greaterThanOrEqualTo: view.centerXAnchor, constant: constant).isActive = true
            case .centerY(let constant):
                centerYAnchor.constraint(greaterThanOrEqualTo: view.centerYAnchor, constant: constant).isActive = true
            case .multiplier(_, edge: _):
                fatalError("Can't be multiplier with relation")
            case .relation(_, edge: _):
                fatalError("Can't be relation with relation")
            }
        }
    }
}

extension Array where Element == UIView.Edge {
    var top: CGFloat? { first { $0.isEdge(.top) }?.value }
    var left: CGFloat? { first { $0.isEdge(.left) }?.value }
    var right: CGFloat? { first { $0.isEdge(.right) }?.value }
    var bottom: CGFloat? { first { $0.isEdge(.bottom) }?.value }
    var centerX: CGFloat? { first { $0.isEdge(.centerX) }?.value }
    var centerY: CGFloat? { first { $0.isEdge(.centerY) }?.value }
}
