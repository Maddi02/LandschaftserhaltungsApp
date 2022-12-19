//
//  RepeatOnboarding.swift
//  Landschaftserhaltungs
//
//  Created by Marc Biehler on 19.12.22.
//

import SwiftUI

struct RepeatOnboarding: View {
    var body: some View {
        VStack {
            Group{
                Text("Das Onboarding kann über das Profil Icon im Hauptmenü wiederholt werden.\n")
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct RepeatOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        RepeatOnboarding()
    }
}




