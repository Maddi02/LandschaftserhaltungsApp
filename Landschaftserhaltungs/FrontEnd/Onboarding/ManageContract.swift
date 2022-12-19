//
//  ManageContract.swift
//  Landschaftserhaltungs
//
//  Created by Marc Biehler on 19.12.22.
//

import SwiftUI

struct ManageContract: View {
    var body: some View {
        VStack {
            Group{
                Text("Verträge verwalten\n")
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("Hier sehen Sie alle angelegten Verträge und können diese über das Icon oben links sortieren.\n")
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("Wenn sie einen angelegten Vertrag nach rechts wischen, können sie die eingegebenen Informationen erneut einsehen oder bearbeiten.\n")
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("[Screenshot Beispiel bearbeiten]\n")
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("Wenn Sie nach links wischen, löschen Sie den Vertrag.\n")
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("[Screenshot Beispiel löschen]\n")
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct ManageContract_Previews: PreviewProvider {
    static var previews: some View {
        ManageContract()
    }
}


