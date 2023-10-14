//
//  Created by Dmitry Sochnev.
//  Copyright © 2023 Dmitry Sochnev. All rights reserved.
//

import UIKit
import FlowUI

final class ImagesViewController: UIViewController {

    // UI components

    private lazy var test1 = imageView(.testImage)

    private lazy var test2 = imageView(.testImage, size: .byImage)

    private lazy var test3 = imageView(.testImage, size: .byImage(scale: 0.5))

    private lazy var test4 = imageView(.testImage, size: .height(170))
        .aspectRatio(5/4)

    private lazy var test5 = imageView(.testImage, size: .width(300))
        .aspectRatio(5/2)

    private lazy var test6 = imageView(.testImage, size: CGSize(width: 100, height: 100))

    private lazy var test7 = imageView(.testImage, size: .square(200))

    private lazy var stack = stack(.vertical, spacing: 16) {
        [test1, test2, test3, test4, test5, test6,test7].map {
            $0.wrappedInContainer(pinnedTo: .top, .bottom, .centerX)
        }
    }

    private lazy var scrollView = scrollView()

    // View controller

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Private
private extension ImagesViewController {
    func setup() {
        title = "Images"

        view.backgroundColor = .systemBackground

        scrollView.addSubview(stack, insets: .symmetry(h: 16, v: 0))
        view.addSubview(scrollView, insets: .zero)
        stack.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive(true)
    }
}
