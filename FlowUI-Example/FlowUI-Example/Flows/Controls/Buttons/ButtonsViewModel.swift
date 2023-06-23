//
//  Created by Dmitry Sochnev.
//  Copyright © 2023 Dmitry Sochnev. All rights reserved.
//

#warning("Don't use UIKit in view models. This added only for testing methods with sender on value type object.")
import UIKit

protocol ButtonsViewModelProtocol {
    func onButton()
    func onButtonWithSender(_ sender: UIButton)
    func onButtonWithValue(_ value: String?)
}

struct ButtonsViewModel: ButtonsViewModelProtocol {
    func onButton() {
        print("ControlsVM: onButton called")
    }

    func onButtonWithSender(_ sender: UIButton) {
        print("ControlsVM: onButtonWithSender(:) called")
    }

    func onButtonWithValue(_ value: String?) {
        print("ControlsVM: onButtonWithValue(\"\(value ?? "nil")\") called")
    }
}
