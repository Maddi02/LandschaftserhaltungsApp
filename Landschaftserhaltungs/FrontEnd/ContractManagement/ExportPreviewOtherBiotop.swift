//
//  ExportPreviewOtherBiotop.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 23.11.22.
//

import SwiftUI

struct PictureViewExportDiffrentBiotop :View
{
    var fieldInformation : FieldInformation
    
    var body : some View
    
    {
        Text("Anzahl der Fotos \(fieldInformation.pictureArray.count)")
        
        
        ForEach(fieldInformation.pictureArray, id: \.self)
        {
            
            i in
            Image(uiImage: i.picutre ?? UIImage()).resizable().scaledToFit()
        }
        
    }
    
}





struct ExportPreviewOtherBiotop: View {
    
    @StateObject var listEntry : ListEntry
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
                        
                        Group{
                            
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
                                
                                Group{
                                    Section(header: Text("Aufgenommene Fotos"))
                                    {
                                        
                                        PictureViewExport(fieldInformation: listEntry.infos ?? FieldInformation())
                                        
                                    }
                                }
                                
                            }
                            
                        }
                        
                        Button("Generate PDF")
                        {

            
                        
                            
                            let pdf = PDFFromGit()
                            
                            pdf.generatePdf()
         
                        }
                    }
                    
                 
                }
            }.navigationBarBackButtonHidden(true)
            
        
        //    Text(listEntry.infos?.bloomAspect ?? "NO Data")
        
        
        
        
        
        Button(action: { NavigationUtil.popToRootView() }) {
            Text("Zurück zum Home Bildschirm")
        }
    }
}


