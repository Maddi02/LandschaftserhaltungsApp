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
            Text("Verträge verwalten")
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Hier sehen Sie alle angelegten Verträge und können diese über das Icon oben links sortieren.")
                .multilineTextAlignment(.center)
                .padding()
            Text("Wenn sie einen angelegten Vertrag nach rechts wischen, können sie die eingegebenen Informationen erneut einsehen oder bearbeiten.")
                .multilineTextAlignment(.center)
                .padding()
            Text("Wenn Sie nach links wischen, löschen Sie den Vertrag.")
                .multilineTextAlignment(.center)
                .padding()
            
        }
    }
}

struct ManageContract_Previews: PreviewProvider {
    static var previews: some View {
        ManageContract()
    }
}


