//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import CoreGraphics

public extension CGSize {
    static func square(_ value: CGFloat) -> Self {
        CGSize(width: value, height: value)
    }
}
