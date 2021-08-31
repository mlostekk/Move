// Copyright (c) 2021 Nomad5. All rights reserved.

import Foundation
import Cocoa
import SwiftUI

class SimpleMoveView: MoveView {

    /// Expose the content view
    var view: NSView {
        hostingView
    }

    /// The SwiftUI view that provides the content.
    private let contentView = SimpleMoveContentView()

    /// The internal ns view
    private var hostingView: NSView

    /// Construction with dependencies
    init(actions: Actions, settings: Settings) {
        hostingView = NSHostingView(
                rootView: contentView
                        .environmentObject(settings)
                        .environmentObject(actions)
        )
    }

}
