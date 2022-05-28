//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIScrollView {
    convenience init(contentInsets: UIEdgeInsets,
                     contentInsetAdjustmentBehavior: ContentInsetAdjustmentBehavior = .automatic) {
        self.init()
        self.contentInset = contentInsets
        self.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func contentInsetAdjustmentBehavior(_ behavior: ContentInsetAdjustmentBehavior) -> Self {
        contentInsetAdjustmentBehavior = behavior
        return self
    }

    func alwaysBounceVertical(_ needBounce: Bool) -> Self {
        alwaysBounceVertical = needBounce
        return self
    }

    func alwaysBounceHorizontal(_ needBounce: Bool) -> Self {
        alwaysBounceHorizontal = needBounce
        return self
    }

    func refreshControl(_ refreshControl: UIRefreshControl) -> Self {
        self.refreshControl = refreshControl
        return self
    }
}
