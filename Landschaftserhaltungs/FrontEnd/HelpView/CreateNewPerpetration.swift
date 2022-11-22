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
    @Environment(\.managedObjectContext) var moc
    @State private var date = Date()
    @State private var description : String = ""

    @State private var isOnFFH = false
    @State private var isOnDiffrent = false
    var dataHandler : DataHandler
    var appContact : AppContract
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
                        let test = ListEntry(context: moc)
                        test.contract = appContact
                        test.detailDescription = description
                        test.descriptionField = selectedStrength
                        test.dateOfObservation = date
                        
                        

                        do{
                            try moc.save()
                        }
                        catch{
                            print("f \(error)")
                        }
                
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