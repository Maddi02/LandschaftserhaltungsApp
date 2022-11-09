//
//  SheetSelectPlants.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 08.11.22.
//

import SwiftUI
import Foundation
struct SheetSelectPlantsShortTerm: View {
    @StateObject var plantSpeciesDataModel = PlantSpeciesDataModel()
    var speciesCensusView : SpeciesCensusView
    @Environment(\.presentationMode) var presentationMode
    
    @State var listDisabled = true
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
                    
                    
                }.disabled(listDisabled)
                
                
                
            }
            Button("Save")
            {
                speciesCensusView.saveEntrys()
                presentationMode.wrappedValue.dismiss()
            }.padding()
            
            TimerView(sheetSelectPlants: self)
            
        }
        

        
        

        
  
        
        
    }
    func selectionActivate()
    {
        listDisabled = false
    }
    
    func selectionDeactivate()
    {
        listDisabled = true
    }
}




