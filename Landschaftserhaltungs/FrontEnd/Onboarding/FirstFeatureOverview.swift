//
//  FirstFeatureOverview.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import SwiftUI

struct FirstFeatureOverview: View {
    var body: some View {
        Text("\"Mein Profil\" \n \n Tragen Sie hier Ihren Bearbeiternamen ein. Dieser wird in den PDFs ersichtlich sein.").multilineTextAlignment(.center)
    }
}

struct FirstFeatureOverview_Previews: PreviewProvider {
    static var previews: some View {
        FirstFeatureOverview()
    }
}
