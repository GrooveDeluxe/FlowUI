//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIImageView {
    enum SizeType {
        case none
        case byImage(scale: CGFloat)
        case width(_ value: CGFloat)
        case height(_ value: CGFloat)

        public static var byImage: Self {
            .byImage(scale: 1.0)
        }
    }

    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }

    @discardableResult
    func image(named: String) -> Self {
        self.image = UIImage(named: named)
        return self
    }

    @discardableResult
    func size(_ sizeType: SizeType) -> Self {
        switch sizeType {
        case .none:
            break
        case .byImage(let scale):
            guard let imageSize = image?.size else { return self }
            size(width: (imageSize.width * scale).rounded(.down), height: (imageSize.height * scale).rounded(.down))
        case .width(let value):
            size(width: value)
        case .height(let value):
            size(height: value)
        }
        return self
    }
}

extension UIImage {
    static func named(_ name: String) -> UIImage? {
        UIImage(named: name)
    }
}
