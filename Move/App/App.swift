// Copyright (c) 2021 Nomad5. All rights reserved.

import Foundation
import Cocoa
import SwiftUI
import Combine

/// The main application model
@objc class App: NSObject {

    /// Dependencies
    private let assembler:         Assembler
    private let windowFactory:     WindowFactory
    private let actions:           Actions

    /// The cancel bag
    private var globalCancelBag                             = CancelBag()
    private var windowCancelBag                             = CancelBag()


    var popover: NSPopover!
    var statusBarItem: NSStatusItem!

    /// The main window
    private let mainWindow: Window

    /// Construction with dependencies
    init(with assembler: Assembler) {
        self.assembler = assembler
        windowFactory = assembler.resolve()
        actions = assembler.resolve()
        mainWindow = windowFactory.createWindow()
    }

    /// Main entry point
    func start() {
        // global start / stop behavior
        globalCancelBag.collect {
            /// Subscribe to start button
            actions.openMoveView.sink { [weak self] in
                guard let self = self else { return }
//                self.mainWindow.open()
            }
        }

        //actions.openMoveViewSubject.send(())

        let a = SimpleMoveContentView()


        // Create the popover
        popover = NSPopover()
        popover.contentSize = NSSize(width: 400, height: 500)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: a)

        // Create the status item
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))

        if let button = self.statusBarItem.button {
            button.title = "TEST"
            button.action = #selector(self.togglePopover(_:))
            button.target = self //critical line
        }
    }

    @objc
    func togglePopover(_ sender: AnyObject?) {
        Log.e("whats up here")
        if let button = self.statusBarItem.button {
            if self.popover.isShown {
                self.popover.performClose(sender)
            } else {
                self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }

    /// Show settings
    func openSettingsView() {
//        actions.openMoveViewSubject.send(())
    }

    func stop() {
    }
}