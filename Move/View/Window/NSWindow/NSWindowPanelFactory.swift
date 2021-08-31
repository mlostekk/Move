// Copyright (c) 2021 Nomad5. All rights reserved.

import Foundation
import Cocoa

class NSWindowPanelFactory: WindowFactory {

    /// Injected dependencies
    private let actions:         Actions
    private let moveViewFactory: MoveViewFactory

    /// Construction with dependencies
    init(actions: Actions,
         moveViewFactory: MoveViewFactory) {
        self.actions = actions
        self.moveViewFactory = moveViewFactory
    }

    func createWindow() -> Window {
        let view = moveViewFactory.createMoveView()
        return NSWindowPanel(view: view, actions: actions)
    }

}
