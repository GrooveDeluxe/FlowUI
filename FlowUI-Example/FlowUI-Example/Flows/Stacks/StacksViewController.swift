//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit
import FlowUI

final class StacksViewController: UIViewController {

    // UI components
    
    private lazy var stackView = stack(.vertical) {

        space(height: 100)
        
        stack(.horizontal, distribution: .equalSpacing) {
            square(size: 40, color: .red)
            square(size: 40, color: .green)
            square(size: 40, color: .blue)
        }

        space(height: 100)

        (0...2).map { _ in
            stack(.vertical) {

                container(color: .orange)
                    .size(height: 10)
                    .cornerRadius(5, mask: [.layerMinXMinYCorner, .layerMaxXMinYCorner])

                space(height: 20)

                stack(.horizontal, distribution: .equalCentering) {

                    container(color: .orange)
                        .size(width: 10)

                    (0...2).map { _ in
                        stack(.vertical, distribution: .equalCentering) {
                            square(size: 20, color: .red)
                            square(size: 20, color: .green)
                            square(size: 20, color: .blue)
                        }
                    }

                    container(color: .orange)
                        .size(width: 10)
                }

                space(height: 20)

                container(color: .orange)
                    .size(height: 10)
                    .cornerRadius(5, mask: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])

                space(height: 20)
            }
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
private extension StacksViewController {
    func setup() {
        title = "Stacks"

        view.backgroundColor = .white

        scrollView.addSubview(stackView, insets: .symmetry(h: 16, v: 0))
        view.addSubview(scrollView, insets: .zero)
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive(true)
    }

    func square(size: CGFloat, color: UIColor) -> UIView {
        container(color: color, size: .square(size))
    }
}
