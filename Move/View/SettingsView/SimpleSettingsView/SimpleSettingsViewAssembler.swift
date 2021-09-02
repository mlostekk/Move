// Copyright (c) 2021 Nomad5. All rights reserved.

import Foundation

protocol SimpleSettingsViewAssembler: MoveViewAssembler {
    func resolve() -> SettingsViewFactory
}

extension SimpleSettingsViewAssembler where Self: Assembler {
    func resolve() -> SettingsViewFactory {
        SimpleSettingsViewFactory(settings: resolve(),
                                  actions: resolve())
    }
}