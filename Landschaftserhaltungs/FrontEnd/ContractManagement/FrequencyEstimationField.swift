//
//  FrequencyEstimationField.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI

struct FrequencyEstimationField: View {
    
    @StateObject var listEntry : ListEntry
    
    var body: some View {
        Text("Hello, Häufigkeitsschätzung")
        Text("\(listEntry.PlantArray.count)")
        Text("\(listEntry.PlantArrayLongTerm.count)")
        
        
        
        
        
        
    }
}

