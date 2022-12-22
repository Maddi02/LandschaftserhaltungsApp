//
//  NewContract.swift
//  Landschaftserhaltungs
//
//  Created by Marc Biehler on 19.12.22.
//

import SwiftUI

struct NewContract: View {
    var body: some View {
        VStack {
            Text("Neuen Vertrag anlegen")
                .multilineTextAlignment(.center)
                .padding()
            Text("Hier können Sie neue Verträge anlegen und in weiteren Schritten Teilflächen anlegen und Artenzählungen und Häufigkeitsschätzungen durchführen.")
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Die Informationen müssen nicht eingegeben werden, aber es empfiehlt sich, da es die Vertragsverwaltung übersichtlich hält.")
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Außerdem kann hier eine Übersichtskarte der Vertragsfläche eingefügt werden.")
                .multilineTextAlignment(.center)
                .padding()
            
        }
    }
}

struct NewContract_Previews: PreviewProvider {
    static var previews: some View {
        NewContract()
    }
}

