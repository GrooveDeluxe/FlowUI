//
//  Created by Dmitry Sochnev.
//  Copyright © 2023 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UISlider {
    convenience init(range: ClosedRange<Float>, value: Float = 0.0) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.minimumValue = range.lowerBound
        self.maximumValue = range.upperBound
        self.value = value
    }

    @discardableResult
    func value(_ value: Float) -> Self {
        self.value = value
        return self
    }

    @discardableResult
    func minimumValue(_ value: Float = 0.0) -> Self {
        minimumValue = value
        return self
    }

    @discardableResult
    func maximumValue(_ value: Float = 1.0) -> Self {
        maximumValue = value
        return self
    }

    @discardableResult
    func minimumValueImage(_ image: UIImage?) -> Self {
        minimumValueImage = image
        return self
    }

    @discardableResult
    func maximumValueImage(_ image: UIImage?) -> Self {
        maximumValueImage = image
        return self
    }

    @discardableResult
    func isContinuous( value: Bool = true) -> Self {
        isContinuous = value
        return self
    }

    @discardableResult
    func minimumTrackTintColor(_ color: UIColor?) -> Self {
        minimumTrackTintColor = color
        return self
    }

    @discardableResult
    func maximumTrackTintColor(_ color: UIColor?) -> Self {
        maximumTrackTintColor = color
        return self
    }

    @discardableResult
    func thumbTintColor(_ color: UIColor?) -> Self {
        thumbTintColor = color
        return self
    }

    @discardableResult
    func thumbImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        setThumbImage(image, for: state)
        return self
    }

    @discardableResult
    func minimumTrackImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        setMinimumTrackImage(image, for: state)
        return self
    }

    @discardableResult
    func maximumTrackImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        setMaximumTrackImage(image, for: state)
        return self
    }
}
