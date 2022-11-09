//
//  SheetSelectPlantsLongTerm.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 09.11.22.
//

import SwiftUI

struct SheetSelectPlantsLongTerm: View {
    @StateObject var plantSpeciesDataModel = PlantSpeciesDataModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var selection: Set<UUID> = []
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        VStack{
            HStack{
                List(){
                    
                    ForEach($plantSpeciesDataModel.platList){
                        list in
                        HStack{
                            Text(list.scientificName.wrappedValue)
                            Toggle("", isOn: list.isChecked)
                            
                        }
                        
                        
                    }
                    
                    
                }
                
                
                
            }
            Button("Cancel")
            {
              
                presentationMode.wrappedValue.dismiss()
            }.padding()
            
          //  TimerView(sheetSelectPlants: self)
            
        }
    }
}


