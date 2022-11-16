//
//  RowView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 16.11.22.
//

import SwiftUI


struct RowViewLongTerm: View {
    var listEntry : ListEntry
    let text: String
    @State var checked : Bool
    @State var checkedTrue : Bool = true
    var body: some View {
        HStack{
            Text(text).foregroundColor(.green)
            
            if(checkIfAllreadySaved(plant: text))
            {
                CheckBoxView(checked: $checkedTrue).disabled(true)
            }
            else{
                CheckBoxView(checked: $checked)
            }
  
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
