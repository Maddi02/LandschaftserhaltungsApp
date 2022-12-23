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
                Section(header: Text("Teilflächen - Details")) {
                    HStack {
                        HStack {
                            Text("Name")
                            Spacer()
                            Text("")
                            
                        }
                        TextField("Bitte eingeben:", text: $description,axis: .vertical).frame(width: nil, height: nil, alignment: .trailing)
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
                    
                    
                    HStack{
                        HStack{
                            Text("Erstellungsdatum")
                            Spacer()
                        }
                        DatePicker(
                            "",
                            selection: $date,
                            displayedComponents: [.date]
                        )
                    }
                    
                 
                    
                    
                    
                    
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
                            print(error)
                        }
                
                    }
                    dismiss()
                }.frame(maxWidth: .infinity, alignment: .center).frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .listRowBackground(Color.blue)
                
            }
            
     
            
            Button("Abbrechen"){
                dismiss()
            }.frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .listRowBackground(Color.blue)
            
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
