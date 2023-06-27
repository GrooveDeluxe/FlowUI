//
//  Created by Dmitry Sochnev.
//  Copyright © 2023 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIPageControl {
    convenience init(numberOfPages: Int, currentPage: Int) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfPages = numberOfPages
        self.currentPage = currentPage
    }

    @discardableResult
    func numberOfPages(_ value: Int) -> Self {
        numberOfPages = value
        return self
    }

    @discardableResult
    func currentPage(_ value: Int) -> Self {
        currentPage = value
        return self
    }

    @discardableResult
    func hidesForSinglePage(_ value: Bool) -> Self {
        hidesForSinglePage = value
        return self
    }

    @discardableResult
    func pageIndicatorTintColor(_ color: UIColor?) -> Self {
        pageIndicatorTintColor = color
        return self
    }

    @discardableResult
    func currentPageIndicatorTintColor(_ color: UIColor?) -> Self {
        currentPageIndicatorTintColor = color
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func backgroundStyle(_ style: UIPageControl.BackgroundStyle) -> Self {
        backgroundStyle = style
        return self
    }

    @available(iOS 16.0, *)
    @discardableResult
    func direction(_ direction: UIPageControl.Direction) -> Self {
        self.direction = direction
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func allowsContinuousInteraction(_ value: Bool) -> Self {
        allowsContinuousInteraction = value
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func preferredIndicatorImage(_ image: UIImage?) -> Self {
        preferredIndicatorImage = image
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func indicatorImage(_ image: UIImage?, forPage page: Int) -> Self {
        setIndicatorImage(image, forPage: page)
        return self
    }

    @available(iOS 16.0, *)
    @discardableResult
    func preferredCurrentPageIndicatorImage(_ image: UIImage?) -> Self {
        preferredCurrentPageIndicatorImage = image
        return self
    }

    @available(iOS 16.0, *)
    @discardableResult
    func currentPageIndicatorImage(_ image: UIImage?, forPage page: Int) -> Self {
        setCurrentPageIndicatorImage(image, forPage: page)
        return self
    }

    @available(iOS, introduced: 2.0, deprecated: 14.0, message: "defersCurrentPageDisplay no longer does anything reasonable with the new interaction mode.")
    @discardableResult
    func defersCurrentPageDisplay(_ value: Bool) -> Self {
        defersCurrentPageDisplay = value
        return self
    }
}
