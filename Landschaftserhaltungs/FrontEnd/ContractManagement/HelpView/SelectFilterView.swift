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
                    dataHandler.sortAscending = false
                }
                dismiss()
            }
            Button("zuerst hinzugefügt") {
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false)
                { _ in
                    dataHandler.filter = .none
                    dataHandler.sortAscending = true
                }
                dismiss()
            }
            Button("nach Abschlussdatum aufsteigend") {
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false)
                { _ in
                    dataHandler.filter = .date
                    dataHandler.sortAscending = true
                }
                dismiss()
            }
            Button("nach Abschlussdatum absteigend") {
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false)
                { _ in
                    dataHandler.filter = .date
                    dataHandler.sortAscending = false
                }
                dismiss()
            }
            Button("nach Fristen aufsteigend") {
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false)
                { _ in
                    dataHandler.filter = .deadline
                    dataHandler.sortAscending = true
                }
                dismiss()
            }
            Button("nach Fristen absteigend") {
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false)
                { _ in
                    dataHandler.filter = .deadline
                    dataHandler.sortAscending = false                }
                dismiss()
            }
            Toggle(isOn: $dataHandler.filterExpiring)
            {
                Text("Nur bald auslaufende Verträge anzeigen")
            }
            Button("Press to dismiss") {
                dismiss()
                
            }
        }
    }
}
