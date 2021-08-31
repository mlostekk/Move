// Copyright (c) 2021 Nomad5. All rights reserved.

import Foundation

class SimpleMoveViewFactory: MoveViewFactory {
    /// Injections
    private let settings: Settings
    private let actions:  Actions

    /// Construction with dependencies
    init(settings: Settings, actions: Actions) {
        self.settings = settings
        self.actions = actions
    }

    func createMoveView() -> MoveView {
        SimpleMoveView(actions: actions, settings: settings)
    }
}