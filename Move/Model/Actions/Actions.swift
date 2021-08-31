// Copyright (c) 2021 Nomad5. All rights reserved.

import Foundation
import Combine

class Actions: Service, ObservableObject {

    /// The unique service key
    private(set) static var uniqueKey: String = String(describing: Actions.self)

    /// Start rendering
    var openMoveView: AnyPublisher<Void, Never> {
        openMoveViewSubject.eraseToAnyPublisher()
    }
    @Published private(set) var openMoveViewSubject = PassthroughSubject<Void, Never>()
}
