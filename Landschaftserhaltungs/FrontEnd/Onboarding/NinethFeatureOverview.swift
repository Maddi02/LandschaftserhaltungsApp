//
//  NinethFeatureOverview.swift
//  Landschaftserhaltungs
//
//  Created by Marc Biehler on 04.12.22.
//

import SwiftUI

struct NinethFeatureOverview: View {
    var body: some View {
        Text("\"Vertragsübersicht\" \n \n Tippen Sie eine Vertragsfläche an. Es erscheint ein Popup, in welchem Sie eine Artenzählung, sowie eine Häufigkeitsschätzung hinzufügen können. \n").multilineTextAlignment(.center)
    }
}

struct NinethFeatureOverview_Previews: PreviewProvider {
    static var previews: some View {
        NinethFeatureOverview()
    }
}
