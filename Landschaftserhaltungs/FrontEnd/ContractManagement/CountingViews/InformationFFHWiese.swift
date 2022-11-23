//
//  InformationFFHWiese.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 09.11.22.
//

import SwiftUI

struct InformationFFHWiese: View {
    @EnvironmentObject  var vm : ViewModel
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
    @State private var showingActionSheet = false
    
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
                    
                    Section(header: Text("Bewertung Arteninventar"))
                    {
                        TextField("Bitte eingeben", text: $evaluationSpeciesInventory ,axis: .vertical)
                    }
                    
                    Section(header: Text("Bewertung Habitatstrukturen"))
                    {
                        TextField("Bitte eingeben", text: $assessmentHabitatStructure ,axis: .vertical)
                    }
                    Group{
                        Section(header: Text("Bewertung Beeinträchtigungen"))
                        {
                            TextField("Bitte eingeben", text: $ratingImpairment ,axis: .vertical)
                        }
                        Section(header: Text("Gesamtbewertung Erhaltungszustand"))
                        {
                            TextField("Bitte eingeben", text: $overallAssessmentOfTheStateOfPreservation ,axis: .vertical)
                        }
                        Section(header: Text("Schutzstatus"))
                        {
                            TextField("Bitte eingeben", text: $protectionStatus ,axis: .vertical)
                        }
                        Section(header: Text("Faunistische Beobachtungen"))
                        {
                            TextField("Bitte eingeben", text: $faunisticObservation,axis: .vertical )
                        }
                        
                        
                    }
                    Button(action: {
                        print("Select")
                        showingActionSheet.toggle()
                    }, label: {
                        
                        HStack{
                            Text("Füge Bilder hinzu")
                            Text(Image(systemName: "camera.on.rectangle.fill"))
                        }.frame(maxWidth: .infinity ,alignment: .center)
                    }).confirmationDialog("Woher soll das Bild genommen werden", isPresented: $showingActionSheet, titleVisibility: .visible) {
                        
                        
                        Button("Foto aufnehmen")
                        {
                            vm.source = .camera
                            vm.showPhotoPicker()
                        }
                        
                        
                        
                        Button("Foto aus Galerie wählen")
                        {
                            vm.source = .library
                            vm.showPhotoPicker()
                            
                        }
                        
                    }
                    
                    if let image = vm.image {
                        ZoomableScrollView {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 10, maxWidth: .infinity)
                        }.scaledToFit()
                    }  else{
                        
                        Image(systemName: "photo.fill")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.6)
                            .frame(minWidth: 10, maxWidth: .infinity)
                            .padding(.horizontal)
                        
                    }
                    
                }       .sheet(isPresented: $vm.showPicker){
                    ImagePickerInformationSide(sourceType : vm.source == .library ? .photoLibrary : .camera, selectedImage: $vm.image).ignoresSafeArea()
                }
                .alert("Error", isPresented: $vm.showCameraAlert, presenting: vm.cameraError, actions: {
                    cameraError in
                    cameraError.button
                }, message: {
                    cameraError in
                    Text(cameraError.message)
                })
            
                
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
