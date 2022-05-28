//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIActivityIndicatorView {
    func animated(_ animated: Bool) -> Self {
        animated ? startAnimating() : stopAnimating()
        return self
    }
}
