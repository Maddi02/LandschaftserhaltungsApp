//
//  SelecFilterView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 01.11.22.
//
import Foundation
import SwiftUI
struct SelectFilterView: View {

    @Environment(\.dismiss) var dismiss
    @ObservedObject  var dataHandler : DataHandler
    var body: some View {
        Text("Wähle die Sortierung aus").font(.title).padding()
        List {
                Button("zuletzt hinzugefügt") {
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false)
                    { _ in
                        dataHandler.filter = .none
                    }
                    dismiss()
                }
                Button("bald auslaufende Verträge") {
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false)
                    { _ in
                        dataHandler.filter = .date
                    }
                    dismiss()
                }
                Button("nach Fristen") {
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false)
                    { _ in
                        dataHandler.filter = .none
                    }
                        dismiss()
                    
                }
                Button("Press to dismiss") {

                        dismiss()
                   
                }
            }
    }
}
