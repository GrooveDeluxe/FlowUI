//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import Foundation

protocol AttributedStringConvertible: Any {
    var attributed: NSAttributedString { get }
    var mutableAttributed: NSMutableAttributedString { get }
}

extension String: AttributedStringConvertible {
    var attributed: NSAttributedString {
        NSAttributedString(string: self)
    }

    var mutableAttributed: NSMutableAttributedString {
        NSMutableAttributedString(string: self)
    }
}

extension NSAttributedString: AttributedStringConvertible {
    var attributed: NSAttributedString {
        self
    }

    var mutableAttributed: NSMutableAttributedString {
        NSMutableAttributedString(attributedString: self)
    }
}
