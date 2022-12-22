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
            Text("Das Onboarding kann über das Profil Icon im Hauptmenü wiederholt werden.\n")
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct RepeatOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        RepeatOnboarding()
    }
}




