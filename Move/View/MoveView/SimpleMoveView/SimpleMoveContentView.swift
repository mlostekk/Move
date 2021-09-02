// Copyright (c) 2021 Nomad5. All rights reserved.

import SwiftUI
import Combine

struct SimpleMoveContentView: View {

    @EnvironmentObject var actions:  Actions
    @EnvironmentObject var settings: Settings

    var body: some View {
        Group {
            Group {
                Image("MovingBody")
                Button(action: {
                    actions.openMoveViewSubject.send(())
                }) {
                    Text("OK")
                            .font(.system(size: 25))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.blue))
                            .frame(width: 100)
                }.buttonStyle(PlainButtonStyle())
            }
            .padding()
        }
        .background(Color.gray)
        .cornerRadius(20)
    }
}

struct SimpleMoveContentViewPreview: PreviewProvider {
    static var previews: some View {
        SimpleMoveContentView()
    }
}
