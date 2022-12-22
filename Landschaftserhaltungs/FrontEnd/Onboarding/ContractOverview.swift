//
//  ContractOverview.swift
//  Landschaftserhaltungs
//
//  Created by Marc Biehler on 19.12.22.
//

import SwiftUI

struct ContractOverview: View {
    var body: some View {
        VStack {

                    Text("Vertragsübersicht")
                            .multilineTextAlignment(.center)
                            .padding()
                    Text("Über das + können Sie dem Vertrag eine Teilfläche hinzufügen. Dabei können Sie einen Namen,die Art der Teilfläche und das Datum der Artenzählung wählen. Die Teilflächen können ebenfalls durch Wischen nach links gelöscht werden.")
                            .multilineTextAlignment(.center)
                            .padding()
                    Text("Für jede Teilfläche können Sie eine Artenzählung und eine Häufigkeitsschätzung durchführen und die Ergebnisse anschließend als PDF-Datei (Bericht) oder CSV-Datei exportieren.")
                            .multilineTextAlignment(.center)
                            .padding()
        
                    Text("Hinweis:")
                            .multilineTextAlignment(.center)
                            .padding()
        
                    Text("Die in der Artenzählung eingegebene Information kann später noch angepasst werden.")
                            .multilineTextAlignment(.center)
                            .padding()
        }
    }
}

struct ContractOverview_Previews: PreviewProvider {
    static var previews: some View {
        ContractOverview()
    }
}



