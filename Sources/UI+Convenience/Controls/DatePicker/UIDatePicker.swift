//
//  Created by Dmitry Sochnev.
//  Copyright © 2023 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIDatePicker {
    convenience init(mode: UIDatePicker.Mode = .dateAndTime,
                     date: Date = Date(),
                     in range: ClosedRange<Date>? = nil) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.datePickerMode = mode
        self.date = date
        self.minimumDate = range?.lowerBound
        self.maximumDate = range?.upperBound
    }

    convenience init(mode: UIDatePicker.Mode = .dateAndTime,
                     date: Date = Date(),
                     in range: PartialRangeFrom<Date>? = nil) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.datePickerMode = mode
        self.date = date
        self.minimumDate = range?.lowerBound
    }

    convenience init(mode: UIDatePicker.Mode = .dateAndTime,
                     date: Date = Date(),
                     in range: PartialRangeThrough<Date>? = nil) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.datePickerMode = mode
        self.date = date
        self.maximumDate = range?.upperBound
    }

    @discardableResult
    func datePickerMode(_ mode: UIDatePicker.Mode) -> Self {
        datePickerMode = .dateAndTime
        return self
    }

    @discardableResult
    func locale(_ locale: Locale?) -> Self {
        self.locale = locale
        return self
    }

    @discardableResult
    func calendar(_ calender: Calendar) -> Self {
        self.calendar = calendar
        return self
    }

    @discardableResult
    func timeZone(_ zone: TimeZone?) -> Self {
        timeZone = zone
        return self
    }

    @discardableResult
    func date(_ date: Date) -> Self {
        self.date = date
        return self
    }

    @discardableResult
    func minimumDate(_ date: Date) -> Self {
        minimumDate = date
        return self
    }

    @discardableResult
    func maximumDate(_ date: Date) -> Self {
        maximumDate = date
        return self
    }

    @discardableResult
    func countDownDuration(_ duration: TimeInterval) -> Self {
        countDownDuration = duration
        return self
    }

    @discardableResult
    func minuteInterval(_ interval: Int) -> Self {
        minuteInterval = interval
        return self
    }

    @available(iOS 13.4, *)
    @discardableResult
    func preferredDatePickerStyle(_ style: UIDatePickerStyle) -> Self {
        preferredDatePickerStyle = style
        return self
    }

    @available(iOS 15.0, *)
    @discardableResult
    func roundsToMinuteInterval(_ value: Bool) -> Self {
        roundsToMinuteInterval = value
        return self
    }
}
