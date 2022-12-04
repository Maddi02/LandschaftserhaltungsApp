//
//  SeventhFeatureOverview.swift
//  Landschaftserhaltungs
//
//  Created by Marc Biehler on 04.12.22.
//

import SwiftUI

struct SeventhFeatureOverview: View {
    var body: some View {
        Text("\"Verträge verwalten\" \n \n Hier sehen Sie eine Übersicht, aller von Ihnen erstellten Verträge. Tippen Sie einen Vertrag an, um Details anzuzeigen. \n").multilineTextAlignment(.center)
    }
}

struct SeventhFeatureOverview_Previews: PreviewProvider {
    static var previews: some View {
        SeventhFeatureOverview()
    }
}
