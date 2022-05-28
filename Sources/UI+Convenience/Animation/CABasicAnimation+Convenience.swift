//
//  Created by Dmitry Sochnev.
//  Copyright © 2022 Dmitry Sochnev. All rights reserved.
//

import UIKit

public extension CABasicAnimation {
    enum AnimationKey: String {
        case rotationKey = "rotationKey"
    }
    static func rotation(from: CGFloat = 0.0,
                         to: CGFloat = CGFloat(Double.pi * 2),
                         duration: TimeInterval,
                         repeatCount: Float = Float.infinity,
                         removeOnCompletion: Bool = false) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = from
        animation.toValue = to
        animation.isRemovedOnCompletion = removeOnCompletion
        animation.duration = duration
        animation.repeatCount = Float.infinity
        return animation
    }
}

public extension UIView {
    func addAnimation(_ animation: CABasicAnimation, forKey: String) {
        layer.add(animation, forKey: forKey)
    }

    func stopAnimation(forKey: String) {
        layer.removeAnimation(forKey: forKey)
    }

    func stopAllAnimations() {
        layer.removeAllAnimations()
    }

    @discardableResult
    func animate(_ animation: CABasicAnimation, key: CABasicAnimation.AnimationKey) -> Self {
        addAnimation(animation, forKey: key.rawValue)
        return self
    }
}
