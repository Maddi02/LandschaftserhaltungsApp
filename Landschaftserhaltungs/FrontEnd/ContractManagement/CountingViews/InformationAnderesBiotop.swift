//
//  InformationAnderesBiotop.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 09.11.22.
//

import SwiftUI

struct InformationAnderesBiotop: View {
    @State private var dataOfTaking = Date()
    @State private var farming : String = ""
    @State private var position : String = ""
    @State private var vegetationDescription : String = ""
    @State private var bloomAspect : String = ""
    @State private var ratingImpairment  : String = ""
    @State private var overallAssessmentOfTheStateOfPreservation  : String = ""
    @State private var faunisticObservation  : String = ""
    @State private var contractTarget  : String = ""
    @State private var adaptationEditions  : String = ""
    @State private var furtherMaintenanceMeasures  : String = ""
    
    
    
    var body: some View {
        
        NavigationView{
            VStack{
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
                            TextField("Bitte eingeben", text: $farming ,axis: .vertical)
                                    
                        }
                        
                        Section(header: Text("Lage"))
                        {
                            TextField("Bitte eingeben", text: $position ,axis: .vertical)
                        }
                        
                        Section(header: Text("Vegetationsbeschreibung"))
                        {
                            TextField("Bitte eingeben", text: $vegetationDescription ,axis: .vertical)
                        }
                        
                        Section(header: Text("Blühaspekt"))
                        {
                            TextField("Bitte eingeben", text: $bloomAspect ,axis: .vertical)
                        }
                        
                        Group{
                    
                            Section(header: Text("Faunistische Beobachtungen"))
                            {
                                TextField("Bitte eingeben", text: $faunisticObservation,axis: .vertical )
                            }
                            
                            Section(header: Text("Vertragsziel erfüllt"))
                            {
                                TextField("Bitte eingeben", text: $contractTarget,axis: .vertical )
                            }
                            
                            Section(header: Text("Anpassung Auflagen"))
                            {
                                TextField("Bitte eingeben", text: $adaptationEditions,axis: .vertical )
                            }
                            
                            Section(header: Text("Weitere Pflegemaßnahmen"))
                            {
                                TextField("Bitte eingeben", text: $furtherMaintenanceMeasures,axis: .vertical )
                            }
                        }

                        Button(action: {
                            print("Select")
                        }, label: {
                          
                            HStack{
                                Text("Füge Bilder hinzu")
                                Text(Image(systemName: "camera.on.rectangle.fill"))
                            }.frame(maxWidth: .infinity ,alignment: .center)
                        })
                        
                    }
                    
            

                    
                    NavigationLink(destination: FFHWieseConclusion()) {
                        Text("Zur Zusammenfassung!")
                    }.navigationBarBackButtonHidden(true)

                }
            }.navigationTitle("Information")
        }.navigationBarBackButtonHidden(true)
    }
}

struct InformationAnderesBiotop_Previews: PreviewProvider {
    static var previews: some View {
        InformationAnderesBiotop()
    }
}
