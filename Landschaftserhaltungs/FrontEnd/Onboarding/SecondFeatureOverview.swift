//
//  SecondFeatureOverview.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import SwiftUI

struct SecondFeatureOverview: View {
    var body: some View {
        Text("\"Mein Profil\" \n \n Wählen Sie die Sprache der Pflanzennamen.\n \n \n").multilineTextAlignment(.center)
    }
}

struct SecondFeatureOverview_Previews: PreviewProvider {
    static var previews: some View {
        SecondFeatureOverview()
    }
}
