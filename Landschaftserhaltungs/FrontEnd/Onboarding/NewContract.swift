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
            Group{
                Text("Neuen Vertrag anlegen\n")
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("Hier können Sie neue Verträge anlegen und in weiteren Schritten Teilflächen anlegen und Artenzählungen und Häufigkeitsschätzungen durchführen.\n")
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("Die Informationen müssen nicht eingegeben werden, aber es empfiehlt sich, da es die Vertragsverwaltung übersichtlich hält.\n")
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("Außerdem kann hier eine Übersichtskarte der Vertragsfläche eingefügt werden.\n")
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct NewContract_Previews: PreviewProvider {
    static var previews: some View {
        NewContract()
    }
}

