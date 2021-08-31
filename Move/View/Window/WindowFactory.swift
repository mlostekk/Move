// Copyright (c) 2021 Nomad5. All rights reserved.

import Foundation
import SwiftUI

/// Abstract factory
protocol WindowFactory {

    func createWindow() -> Window
}
