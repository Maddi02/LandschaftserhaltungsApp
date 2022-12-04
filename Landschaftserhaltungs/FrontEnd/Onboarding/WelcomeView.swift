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
                Text("Herzlich Willkommen \n\n Onboarding zur digitalen Erfassung von Landschaftsflächen")
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
