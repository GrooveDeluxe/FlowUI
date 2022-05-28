//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIImageView {
    enum SizeType {
        case none
        case byImage
        case bySize(CGSize)
        case byRatio(CGFloat)
        case size(width: CGFloat?, height: CGFloat?)
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
    func size(_ size: UIImageView.SizeType = .byImage) -> Self {
        switch size {
        case .none:
            return self
        case .byImage:
            return self.size(width: image?.size.width, height: image?.size.height)
        case .bySize(let size):
            return self.size(width: size.width, height: size.height)
        case .byRatio(let ratio):
            guard let width = image?.size.width, let height = image?.size.height else { return self }
            return self.size(width: (width * ratio).rounded(.down), height: (height * ratio).rounded(.down))
        case .size(width: let width, height: let height):
            return self.size(width: width, height: height)
        }
    }
}

extension UIImage {
    static func named(_ name: String) -> UIImage? {
        UIImage(named: name)
    }
}
