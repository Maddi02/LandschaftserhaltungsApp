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
                Text("Profil anpassen\n")
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("Im Hauptmenü können Sie über das Profil Icon Ihren Namen und das Logo anpassen (Der Name und das Logo werden im PDF-Bericht angezeigt).\n")
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("Außerdem können hier noch die Sprache der Pflanzennamen, die in der Artenliste angezeigt werden sollen, und die Qualität der in der App gespeicherten Bilder angepasst werden.\n")
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("Über “CSV auswählen” können Sie eine Artenliste importieren, die für die Artenzählung genutzt wird (Wenn keine CSV-Datei ausgewählt wird, funktioniert die Artenzählung u.a. nicht).\n")
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
