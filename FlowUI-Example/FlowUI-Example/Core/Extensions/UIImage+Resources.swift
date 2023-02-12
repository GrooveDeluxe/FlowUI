//
//  Created by Dmitry Sochnev.
//  Copyright © 2023 Dmitry Sochnev. All rights reserved.
//

import UIKit

extension UIImage {
    static var testImage: UIImage {
        .image("test_image")
    }
}

private extension UIImage {
    static func image(_ name: String) -> UIImage {
        guard let image = UIImage(named: name) else {
            assertionFailure("Can't find image \(name)")
            return UIImage()
        }
        return image
    }
}
