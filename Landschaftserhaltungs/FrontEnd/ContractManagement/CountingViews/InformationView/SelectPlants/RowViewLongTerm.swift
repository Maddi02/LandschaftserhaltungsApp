//
//  RowView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 16.11.22.
//

import SwiftUI


struct RowViewLongTerm: View {
    @State var plant : PlantSpecies
    @ObservedObject var plantSpeciesDataModel : PlantSpeciesDataModel
    @State  var plantSpecies : [PlantSpecies]
    @State var checked : Bool
    @State var checkedTrue : Bool = true
    var listEntry : ListEntry
    let text: String
    
    
    var body: some View {
        HStack{
          
        
            if(checkIfAllreadySaved(plant: text))
            {
                CheckBoxView(checked: $checkedTrue).disabled(true)
                
            }

            else {
                CheckBoxView(checked: $checked).onChange(of: checked, perform: {
                    newValue in
                    if(checked)
                    {
                        plant.isChecked = true
                    }
                    
                })
               
       
            }
            Text(text)
        }

    }

    func checkIfAllreadySaved(plant : String) -> Bool
    {
        for i in listEntry.PlantArray
        {
            if(i.scientificName == plant || i.germanName == plant)
            {
                return true
            }
        }
        return false
    }
}
