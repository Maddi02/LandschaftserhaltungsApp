//
//  ExportForeCast.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI

struct ExportPreviewFFH: View {
    @StateObject var listEntry: ListEntry
    var body: some View {
        
        
        
        VStack{
            
            VStack{
                
                
                Form
                {
                    Section(header: Text("Datum"))
                    {
                        Text(listEntry.infos?.dataOfTaking?.toString() ?? "No Data")
                    }
                    
                    Section(header: Text("Bewirtschaftung"))
                    {
                        Text(listEntry.infos?.farming ?? "No Data")
                        
                    }
                    
                    Section(header: Text("Lage"))
                    {
                        Text(listEntry.infos?.position ?? "No Data")
                    }
                    
                    Section(header: Text("Vegetationsbeschreibung"))
                    {
                        Text(listEntry.infos?.vegetationDescription ?? "No Data")
                    }
                    
                    Section(header: Text("Blühaspekt"))
                    {
                        Text(listEntry.infos?.bloomAspect ?? "No Data")
                    }
                    
                    Section(header: Text("Bewertung Arteninventar"))
                    {
                        Text(listEntry.infos?.evaluationSpeciesInventory ?? "No Data")
                    }
                    
                    Section(header: Text("Bewertung Habitatstrukturen"))
                    {
                        Text(listEntry.infos?.assessmentHabitatStructure ?? "No Data")
                    }
                    Group{
                        Section(header: Text("Bewertung Beeinträchtigungen"))
                        {
                            Text(listEntry.infos?.ratingImpairment ?? "No Data")
                        }
                        Section(header: Text("Gesamtbewertung Erhaltungszustand"))
                        {
                            Text(listEntry.infos?.overallAssessmentOfTheStateOfPreservation ?? "No Data")
                        }
                        Section(header: Text("Schutzstatus"))
                        {
                            Text(listEntry.infos?.protectionStatus ?? "No Data")
                        }
                        Section(header: Text("Faunistische Beobachtungen"))
                        {
                            Text(listEntry.infos?.faunisticObservation ?? "No Data")
                        }
                        
                        Section(header: Text("Vertragsziel erfüllt"))
                        {
                            Text(listEntry.infos?.contractTarget ?? "No Data")
                        }
                        
                        Section(header: Text("Anpassung Auflagen"))
                        {
                            Text(listEntry.infos?.adaptationEditions ?? "No Data")
                        }
                        
                        Section(header: Text("Weiter Pflegemaßnahme"))
                        {
                            Text(listEntry.infos?.furtherMaintenanceMeasures ?? "No Data")
                        }
                        
                        
                        Group{
                        Section(header: Text("Anzahl der Pflanzen Schnellaufnahme"))
                            {
                                Text("\(listEntry.PlantArray.count) Arten" )
                                
                                
                                List{
                                    
                                    
                                    ForEach(listEntry.PlantArray)
                                    {
                                        i in
                                        Text("\(i.scientificName ?? "hhh") (\(i.germanName ?? "hh"))" )
                                    }
                                }
                                
                            }
                       
                            Section(header: Text("Anzahl der Pflanzen - Genau Aufnahme"))
                            {
                                Text("\(listEntry.PlantArrayLongTerm.count) Arten" )
                                List{
                                    
                                    
                                    ForEach(listEntry.PlantArrayLongTerm)
                                    {
                                        i in
                                        Text("\(i.scientificName ?? "hhh") (\(i.germanName ?? "hh"))" )
                                    }
                                }
                                
                            }
                            
                            Section(header: Text("Gesamtanzahl der Pflanzen"))
                            {
                                Text("\(listEntry.PlantArrayLongTerm.count + listEntry.PlantArray.count) Arten" )
                                
                                List{
                                    
                                    
                                    ForEach(listEntry.PlantArrayLongTerm)
                                    {
                                        i in
                                        Text("\(i.scientificName ?? "hhh") (\(i.germanName ?? "hh"))" )
                                    }
                                    ForEach(listEntry.PlantArray)
                                    {
                                        i in
                                        Text("\(i.scientificName ?? "hhh") (\(i.germanName ?? "hh"))" )
                                    }

                                }
                                
                            }
                            Section(header: Text("Gesamtanzahl der Pflanzen in Roter Liste"))
                            {
                                Text(" Keine Ahnung woher ich wisse soll Arten" )
                                
                                List{
                           
                                }
                                
                            }
                            
                            Section(header: Text("Magerkeitszeiger"))
                            {
                                Text(" Keine Ahnung woher ich wisse soll Arten" )
                                
                                List{
                           
                                }
                                
                            }
                            
                            Section(header: Text("Beeinträchtigende Arten"))
                            {
                                Text(" Keine Ahnung woher ich wisse soll Arten" )
                                
                                List{
                           
                                }
                                
                            }

                            
                    }

                    }
                
                    
                }
            }
        }
        
        
        //    Text(listEntry.infos?.bloomAspect ?? "NO Data")
        
        
        
        
        
        Button(action: { NavigationUtil.popToRootView() }) {
            Text("Zurück zum Home Bildschirm")
        }
    }
}
