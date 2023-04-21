//
//  Created by Dmitry Sochnev.
//  Copyright © 2023 Dmitry Sochnev. All rights reserved.
//

import Foundation

protocol MiscViewModelProtocol {
    func onEmptyButton()
    func onImageButton()
}

struct MiscViewModel: MiscViewModelProtocol {
    func onEmptyButton() {
        print("MiscViewModel: onEmptyButton called")
    }

    func onImageButton() {
        print("MiscViewModel: onImageButton called")
    }
}
