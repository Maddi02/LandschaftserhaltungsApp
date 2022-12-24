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
            
            Text("Onboaring wiederholen")   .font(.title)
            Text("Das Onboarding kann über das Profil Icon im Hauptmenü wiederholt werden.").padding()        .font(.system(size: 14))
             
        }
    }
}

struct RepeatOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        RepeatOnboarding()
    }
}




