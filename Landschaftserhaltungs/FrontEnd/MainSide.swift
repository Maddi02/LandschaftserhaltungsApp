//
//  MainSide.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import Foundation
import SwiftUI

struct MainSide:  View {
    @EnvironmentObject var appState : AppState
    var body: some View {
        Text("Main VIEW")
        Button("Reset")
        {
            appState.hasOnboarded = false
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MainSide()
    }
}
