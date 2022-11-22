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
    @State private var protectionStatus  : String = ""
    @State private var overallAssessmentOfTheStateOfPreservation  : String = ""
    @State private var faunisticObservation  : String = ""
    
    var body: some View {
        
        NavigationView{
            
            
   
            VStack{
                Form
                {
                    Section(header: Text("Datum"))
                    {
                                DatePicker(selection: $dataOfTaking,
                                           displayedComponents: [.date],
                                           label: { Text("Datum der Begehung") })
                                
                    }
                    
                    Section(header: Text("Bewirtschaftung"))
                    {
                        TextField("Bitte eingeben", text: $farming)
                                
                    }
                    
                    Section(header: Text("Lage"))
                    {
                        TextField("Bitte eingeben", text: $position)
                    }
                    
                    Section(header: Text("Vegetationsbeschreibung"))
                    {
                        TextField("Bitte eingeben", text: $vegetationDescription)
                    }
                    
                    Section(header: Text("Blühaspekt"))
                    {
                        TextField("Bitte eingeben", text: $bloomAspect)
                    }
                    
                    Section(header: Text("Bewertung Arteninventar"))
                    {
                        TextField("Bitte eingeben", text: $evaluationSpeciesInventory)
                    }
                    
                    Section(header: Text("Bewertung Habitatstrukturen"))
                    {
                        TextField("Bitte eingeben", text: $assessmentHabitatStructure)
                    }
                    Group{
                        Section(header: Text("Bewertung Beeinträchtigungen"))
                        {
                            TextField("Bitte eingeben", text: $ratingImpairment)
                        }
                        Section(header: Text("Gesamtbewertung Erhaltungszustand"))
                        {
                            TextField("Bitte eingeben", text: $overallAssessmentOfTheStateOfPreservation)
                        }
                        Section(header: Text("Schutzstatus"))
                        {
                            TextField("Bitte eingeben", text: $protectionStatus)
                        }
                        Section(header: Text("Faunistische Beobachtungen"))
                        {
                            TextField("Bitte eingeben", text: $faunisticObservation)
                        }
                    } 
                }
                NavigationLink(destination: FFHWieseConclusion()) {
                    Text("Zur Zusammenfassung!")
                }.navigationBarBackButtonHidden(true)

            }.navigationTitle("Information")
 
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct InformationFFHWiese_Previews: PreviewProvider {
    static var previews: some View {
        InformationFFHWiese()
    }
}
