//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public protocol ViewGroup {
    var elements: [UIView] { get }
}

extension UIView: ViewGroup {
    public var elements: [UIView] { [self] }
}

extension Array: ViewGroup where Element == UIView {
    public var elements: [UIView] { self }
}

@resultBuilder
public struct UIViewBuilder {
    public static func buildBlock(_ components: ViewGroup...) -> [UIView] {
        components.flatMap { $0.elements }
    }

    public static func buildOptional(_ component: [ViewGroup]?) -> [UIView] {
        component?.flatMap { $0.elements } ?? []
    }

    public static func buildEither(first component: [ViewGroup]) -> [UIView] {
        component.flatMap { $0.elements }
    }

    public static func buildEither(second component: [ViewGroup]) -> [UIView] {
        component.flatMap { $0.elements }
    }

    public static func buildArray(_ components: [ViewGroup]) -> [UIView] {
        components.flatMap { $0.elements }
    }
}
