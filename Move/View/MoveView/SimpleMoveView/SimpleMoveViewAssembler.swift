// Copyright (c) 2021 Nomad5. All rights reserved.

import Foundation

protocol SimpleMoveViewAssembler: MoveViewAssembler {
    func resolve() -> MoveViewFactory
}

extension SimpleMoveViewAssembler where Self: Assembler {
    func resolve() -> MoveViewFactory {
        SimpleMoveViewFactory(settings: resolve(),
                              actions: resolve())
    }
}