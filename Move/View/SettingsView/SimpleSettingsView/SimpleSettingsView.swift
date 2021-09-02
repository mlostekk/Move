// Copyright (c) 2021 Nomad5. All rights reserved.

import Foundation
import SwiftUI
import Cocoa

class SimpleSettingsView: SettingsView {

    /// UI elements
    private let statusBarItem: NSStatusItem
    private let swiftUIView:   AnyView
    private let popover:       NSPopover

    /// - Parameters:
    init(actions: Actions, settings: Settings) {

        swiftUIView = AnyView(SimpleSettingsContentView()
                                      .environmentObject(settings)
                                      .environmentObject(actions))

        // Create the popover
        popover = NSPopover()
        popover.contentSize = NSSize(width: 400, height: 500)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: swiftUIView)

        // Create the status item
        statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))

        if let button = statusBarItem.button {
            button.title = "TEST"
            button.action = #selector(togglePopover(_:))
            button.target = self
        }
    }

    @objc
    func togglePopover(_ sender: AnyObject?) {
        Log.e("whats up here")
        if let button = self.statusBarItem.button {
            if popover.isShown {
                popover.performClose(sender)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}