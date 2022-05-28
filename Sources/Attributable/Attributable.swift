//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import Foundation

public protocol Attributable {
    var attributes: [NSAttributedString.Key: Any] { get }
}

public protocol AttributedStringConvertible: Any {
    var attributed: NSAttributedString { get }
    var mutableAttributed: NSMutableAttributedString { get }
}

extension String: AttributedStringConvertible {
    public var attributed: NSAttributedString {
        NSAttributedString(string: self)
    }

    public var mutableAttributed: NSMutableAttributedString {
        NSMutableAttributedString(string: self)
    }
}

extension NSAttributedString: AttributedStringConvertible {
    public var attributed: NSAttributedString {
        self
    }

    public var mutableAttributed: NSMutableAttributedString {
        NSMutableAttributedString(attributedString: self)
    }
}
