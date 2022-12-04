//
//  EighthFeatureOverview.swift
//  Landschaftserhaltungs
//
//  Created by Marc Biehler on 04.12.22.
//

import SwiftUI

struct EighthFeatureOverview: View {
    var body: some View {
        Text("\"Vertragsübersicht\" \n \n Zu einem Vertrag können mehrere Vertragsflächen gehören. Über das + können Sie weitere Flächen hinzufügen. \n").multilineTextAlignment(.center)
    }
}

struct EighthFeatureOverview_Previews: PreviewProvider {
    static var previews: some View {
        EighthFeatureOverview()
    }
}
