//
//  InformationFFHWiese.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 09.11.22.
//

import SwiftUI

struct InformationFFHWiese: View {
    
    @State private var dataOfTaking = Date()
    @State private var farming : String = ""
    @State private var position : String = ""
    @State private var vegetationDescription : String = ""
    @State private var bloomAspect : String = ""
    @State private var evaluationSpeciesInventory : String = ""
    @State private var assessmentHabitatStructure : String = ""
    @State private var ratingImpairment  : String = ""
    @State private var overallAssessmentOfTheStateOfPreservation  : String = ""
    @State private var faunisticObservation  : String = ""
    
    var body: some View {
        
        NavigationView{
            
            
   
            VStack{
                Form
                {
                    Section(header: Text("Datum"))
                    {
                        HStack {
                          
                                DatePicker(selection: $dataOfTaking,
                                           displayedComponents: [.date],
                                           label: { Text("Datum der Begehung") })
                                
                            }
                    }
                }
                
                Text("Hello, World! Anderes Biotop").navigationBarBackButtonHidden(true)
            }.navigationTitle("Information")
        }.navigationBarBackButtonHidden(true)
    }
}

struct InformationFFHWiese_Previews: PreviewProvider {
    static var previews: some View {
        InformationFFHWiese()
    }
}
