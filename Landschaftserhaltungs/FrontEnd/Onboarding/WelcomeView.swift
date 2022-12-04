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
                Text("Herzlich Willkommen \n")
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("im Onboarding zur digitalen Erfassung von Landschaftsflächen")
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
