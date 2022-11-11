//
//  SheetSelectPlantsLongTerm.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 09.11.22.
//

import SwiftUI

struct SheetSelectPlantsLongTerm: View {
    @StateObject var plantSpeciesDataModel = PlantSpeciesDataModel()
    var longTimeSpeciesCencus : LongTimeSpeciesCensus
    @StateObject var listEntry : ListEntry
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
            NavigationLink(destination:  getDestination().onAppear{
                longTimeSpeciesCencus.saveEntrysLongTerm()
            })
            {
                Text("Save & geh zur nächsten Seite")
            }
            
          //  TimerView(sheetSelectPlants: self)
            
        }
    }
    private func getDestination() -> AnyView
    {
        
        if(listEntry.descriptionField == "FFH Mähwiese")
        {
            return AnyView(InformationFFHWiese())
        }
        else {
            return AnyView(InformationAnderesBiotop())
        }
        
    }
}


