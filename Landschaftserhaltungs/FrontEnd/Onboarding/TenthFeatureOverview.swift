//
//  TenthFeatureOverview.swift
//  Landschaftserhaltungs
//
//  Created by Marc Biehler on 04.12.22.
//

import SwiftUI

struct TenthFeatureOverview: View {
    var body: some View {
        Text("\"Vertragsübersicht\" \n \n Tippen Sie eine Vertragsfläche an. Es erscheint ein Popup, in welchem Sie die Vertragsfläche als PDF oder CSV exportieren können. \n").multilineTextAlignment(.center)
    }
}

struct TenthFeatureOverview_Previews: PreviewProvider {
    static var previews: some View {
        TenthFeatureOverview()
    }
}
