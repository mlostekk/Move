// Copyright (c) 2021 Nomad5. All rights reserved.

import Foundation
import SwiftUI

class SimpleSettingsViewFactory: SettingsViewFactory {

    /// Injections
    private let settings: Settings
    private let actions:  Actions

    /// Construction with dependencies
    init(settings: Settings, actions: Actions) {
        self.settings = settings
        self.actions = actions
    }

    /// Create the settings view
    func create() -> SettingsView {
        SimpleSettingsView(actions: actions, settings: settings)
    }
}