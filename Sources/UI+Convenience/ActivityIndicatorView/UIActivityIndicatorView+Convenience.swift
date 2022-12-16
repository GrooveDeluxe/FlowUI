//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIActivityIndicatorView {
    convenience init(_ style: UIActivityIndicatorView.Style, color: UIColor = .gray, hidesWhenStopped: Bool = true) {
        self.init(style: style)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.color = color
        self.hidesWhenStopped = hidesWhenStopped
    }
    
    @discardableResult
    func style(_ newStyle: UIActivityIndicatorView.Style) -> Self {
        style = newStyle
        return self
    }

    @discardableResult
    func hidesWhenStopped(_ hides: Bool) -> Self {
        hidesWhenStopped = hides
        return self
    }

    @discardableResult
    func color(_ newColor: UIColor) -> Self {
        color = newColor
        return self
    }

    @discardableResult
    func animated(_ animated: Bool) -> Self {
        animated ? startAnimating() : stopAnimating()
        return self
    }
}
