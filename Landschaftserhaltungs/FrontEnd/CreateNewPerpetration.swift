//
//  CreateNewPerpetration.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI

struct CreateNewPerpetration: View {
    
    @State private var selectedStrength = "FFH Mähwiese"
        let strengths = ["FFH Mähwiese", "Anderes Biotop"]
    @State private var date = Date()
    @State private var description : String = ""
    @State private var isOnFFH = false
    @State private var isOnDiffrent = false
    var dataHandler : DataHandler
    @Environment(\.dismiss) var dismiss
    var body: some View {
        

        VStack{
            Form{
                Section(header: Text("Vertragsflächen - Details")) {
                    HStack {
                        HStack {
                            Text("Beschreibung")
                            Spacer()
                            
                        }
                        
                        HStack {
                            TextField("Text:", text: $description,axis: .vertical)
                        }
                        
                    }
                    
                    HStack{
                        HStack {
                            Text("Typ")
                            Spacer()
                            
                        }
                        HStack {
                            Section {
                                Picker("", selection: $selectedStrength) {
                                    ForEach(strengths, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.menu)
                            }.frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                    
                    DatePicker(
                        "Datum der Begehung",
                        selection: $date,
                        displayedComponents: [.date]
                    ).frame(maxWidth: .infinity, alignment: .center).padding(.trailing,80)
                    
                    
                    
                    
                }
                Button("Speichern"){
                    Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false)
                    { _ in
                        dataHandler.listItemContractArea.append(ListItemContractArea(description: description, date: date, typ: selectedStrength))
                    }
                    dismiss()
                }.frame(maxWidth: .infinity, alignment: .center)
                
            }
            
     
            
            Button("Abbrechen"){
                dismiss()
            }
            
        }
    }
}
/*
 struct CreateNewPerpetration_Previews: PreviewProvider {
 static var previews: some View {
 CreateNewPerpetration(datahandler: )
 }
 }
 */
