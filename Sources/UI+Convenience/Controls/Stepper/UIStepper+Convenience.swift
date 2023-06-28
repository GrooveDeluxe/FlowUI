//
//  Created by Dmitry Sochnev.
//  Copyright © 2023 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIStepper {
    convenience init(range: ClosedRange<Double>, step: Double = 1.0, value: Double = 0.0) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.minimumValue = range.lowerBound
        self.maximumValue = range.upperBound
        self.stepValue = step
        self.value = value
    }

    @discardableResult
    func isContinuous(_ value: Bool) -> Self {
        isContinuous = value
        return self
    }

    @discardableResult
    func autorepeat(_ value: Bool) -> Self {
        autorepeat = value
        return self
    }

    @discardableResult
    func wraps(_ value: Bool) -> Self {
        wraps = value
        return self
    }

    @discardableResult
    func value(_ value: Double) -> Self {
        self.value = value
        return self
    }

    @discardableResult
    func minimumValue(_ value: Double) -> Self {
        minimumValue = value
        return self
    }

    @discardableResult
    func maximumValue(_ value: Double) -> Self {
        maximumValue = value
        return self
    }

    @discardableResult
    func stepValue(_ value: Double) -> Self {
        stepValue = value
        return self
    }

    @discardableResult
    func backgroundImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }

    @discardableResult
    func dividerImage(_ image: UIImage?,
                      forLeftSegmentState leftState: UIControl.State,
                      rightSegmentState rightState: UIControl.State)  -> Self {
        setDividerImage(image, forLeftSegmentState: leftState, rightSegmentState: rightState)
        return self
    }

    @discardableResult
    func incrementImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        setIncrementImage(image, for: state)
        return self
    }

    @discardableResult
    func decrementImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        setDecrementImage(image, for: state)
        return self
    }
}
