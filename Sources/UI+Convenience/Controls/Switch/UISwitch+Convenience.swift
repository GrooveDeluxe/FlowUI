//
//  Created by Dmitry Sochnev.
//  Copyright © 2023 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UISwitch {
    convenience init(isOn: Bool = false) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isOn = isOn
    }
    
    @discardableResult
    func onTintColor(_ color: UIColor?) -> Self {
        onTintColor = color
        return self
    }

    @discardableResult
    func thumbTintColor(_ color: UIColor?) -> Self {
        thumbTintColor = color
        return self
    }

    @discardableResult
    func onImage(_ image: UIImage?) -> Self {
        onImage = image
        return self
    }

    @discardableResult
    func offImage(_ image: UIImage?) -> Self {
        offImage = image
        return self
    }

    /// The title displayed alongside the switch, positioned appropriately for the @c UIUserInterfaceIdiom.
    /// @note This property is only supported for Catalyst in the Mac idiom.
    @available(iOS 14.0, *)
    func title(_ value: String?) -> Self {
        title = value
        return self
    }

    /// Request a style for the switch. If the style changed, then the switch may resize.
    @available(iOS 14.0, *)
    @discardableResult
    func preferredStyle(_ style: UISwitch.Style) -> Self {
        preferredStyle = style
        return self
    }

    @discardableResult
    func isOn(_ value: Bool) -> Self {
        isOn = value
        return self
    }
}
