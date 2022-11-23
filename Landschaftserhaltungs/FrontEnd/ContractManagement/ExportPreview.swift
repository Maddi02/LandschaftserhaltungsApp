//
//  ExportForeCast.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI

struct ExportPreview: View {
    @StateObject var listEntry: ListEntry
    var body: some View {
        
       Text("Pflanzen aus der Schnellaufnahme")
        List{
            ForEach(listEntry.PlantArray)
            {
                i in
                Text(i.scientificName ?? "hhh")
            }
        }
        
        Text("Pflanzen aus der Langaufnahme")
         List{
             ForEach(listEntry.PlantArrayLongTerm)
             {
                 i in
                 Text(i.scientificName ?? "hhh")
             }
         }
        
        Text(listEntry.infos?.bloomAspect ?? "NO Data")
        
        
        
        Button(action: { NavigationUtil.popToRootView() }) {
               Text("Zurück zum Home Bildschirm")
             }
    }
}


