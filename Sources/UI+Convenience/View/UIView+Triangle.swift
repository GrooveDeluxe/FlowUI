//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension UIView {
    enum Direction {
        case up
        case left
        case right
        case down
    }

    func triangle(size: CGSize, color: UIColor, direction: Direction) -> UIView {
        let frame = CGRect(origin: .zero, size: size)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: size.width / 2, y: 0))
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.addLine(to: CGPoint(x: 0, y: size.height))
        path.close()
        let layer = CAShapeLayer()
        layer.frame = frame
        layer.path = path.cgPath
        layer.fillColor = color.cgColor
        let view = UIView(frame: frame)
        view.layer.addSublayer(layer)
        return view
    }
}
