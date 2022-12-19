//
//  CustomiseProfile.swift
//  Landschaftserhaltungs
//
//  Created by Marc Biehler on 19.12.22.
//

import SwiftUI

struct CustomiseProfile: View {
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

struct CustomiseProfile_Previews: PreviewProvider {
    static var previews: some View {
        CustomiseProfile()
    }
}
