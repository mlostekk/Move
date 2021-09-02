// Copyright (c) 2021 Nomad5. All rights reserved.

import Cocoa
import SwiftUI

class NSWindowPanel: Window {

    /// The window
    private let window:  NSWindow

    /// Injections
    private let actions: Actions

    /// Create the window
    init(view: NativeView, actions: Actions) {
        self.actions = actions
        let mainScreen = NSScreen.main!.frame

       window = NSWindow(contentRect: .zero,
                          styleMask: [.nonactivatingPanel, .borderless],
                          backing: .buffered,
                          defer: true)

        window.level = .statusBar // .mainMenu
        window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        window.contentView = view.view

        window.isReleasedWhenClosed = false

        let width      = view.view.frame.width
        let height     = view.view.frame.height
        let rect       = CGRect(origin: CGPoint(x: mainScreen.width / 2 - width / 2,
                                                y: mainScreen.height / 2 - height / 2),
                                size: window.frame.size)
        window.setFrame(rect, display: true)

        open()
    }

    /// Destruction
    deinit {
        Log.d("Window destroyed")
    }

    /// Pass down the image
    func open() {
        window.makeKeyAndOrderFront(nil)
    }

    /// Close the window
    func close() {
        window.close()
    }
}
