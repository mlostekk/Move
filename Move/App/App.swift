// Copyright (c) 2021 Nomad5. All rights reserved.

import Foundation
import Cocoa
import SwiftUI
import Combine

/// The main application
class App: NSObject {

    /// Dependencies
    private let assembler:    Assembler
    private let actions:      Actions

    /// The cancel bag
    private var globalCancelBag = CancelBag()
    private var windowCancelBag = CancelBag()

    /// The windows
    private let mainWindow:   Window
    private let settingsView: SettingsView

    /// Construction with dependencies
    init(with assembler: Assembler) {
        self.assembler = assembler
        let windowFactory: WindowFactory = assembler.resolve()
        actions = assembler.resolve()
        mainWindow = windowFactory.createWindow()
        let settingsFactory: SettingsViewFactory = assembler.resolve()
        settingsView = settingsFactory.create()
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

    }

    /// Show settings
    func openSettingsView() {
//        actions.openMoveViewSubject.send(())
    }

    func stop() {
    }
}