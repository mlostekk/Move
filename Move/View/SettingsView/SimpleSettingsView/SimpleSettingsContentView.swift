// Copyright (c) 2021 Nomad5. All rights reserved.

import Foundation
import SwiftUI

struct SimpleSettingsContentView: View {

    @EnvironmentObject var actions:  Actions
    @EnvironmentObject var settings: Settings

    var body: some View {
        Group {
            Text("ASDFLKASDJFLJALSKDF")
        }
    }
}

struct SimpleSimpleSettingsContentView: PreviewProvider {
    static var previews: some View {
        SimpleSettingsContentView()
    }
}