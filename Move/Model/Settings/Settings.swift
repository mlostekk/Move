// Copyright (c) 2021 Nomad5. All rights reserved.

import Foundation
import Combine

class Settings: Service, ObservableObject {

    /// The unique service key
    private(set) static var uniqueKey: String = String(describing: Settings.self)

    @Published var sittingDuration: Double = 10.0
}
