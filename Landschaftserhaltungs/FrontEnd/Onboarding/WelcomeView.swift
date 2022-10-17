//
//  WelcomeView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Group{
                Text("Willkommen zur digitalen Erfassung von Landschaftsfläche")
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
