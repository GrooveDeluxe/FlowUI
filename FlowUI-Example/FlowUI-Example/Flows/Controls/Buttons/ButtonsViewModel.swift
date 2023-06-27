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
        print("ButtonsVM: onButton called")
    }

    func onButtonWithSender(_ sender: UIButton) {
        print("ButtonsVM: onButtonWithSender(:) called")
    }

    func onButtonWithValue(_ value: String?) {
        print("ButtonsVM: onButtonWithValue(\"\(value ?? "nil")\") called")
    }
}
