//
//  InformationFFHWiese.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 09.11.22.
//

import SwiftUI

struct InformationFFHWiese: View {
    @Environment(\.managedObjectContext) var moc
    @State var listEntry : ListEntry
    @State private var removeUnneadedPicture = true
    @EnvironmentObject  var vm : ViewModel
    @StateObject var viewModelPicutre = pictureVM()
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
                    
                    List{
                  
                        ForEach(viewModelPicutre.pictures)
                        {
                            i in
                            
                          
                                ZoomableScrollView {
                                    Image(uiImage: i.picuture)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(minWidth: 10, maxWidth: .infinity)
                                }.scaledToFit()
                           
                            
                        }
              
                        
                    }       .sheet(isPresented: $vm.showPicker){
                        ImagePickerInformationSide(sourceType : vm.source == .library ? .photoLibrary : .camera, selectedImage: $vm.image).ignoresSafeArea()
                
                    }.onChange(of: vm.image, perform: {newValue in
                        
                        if removeUnneadedPicture{
                            if viewModelPicutre.pictures.count == 1
                            {
                                viewModelPicutre.pictures.remove(at: 0)
                            }
                        }
                        print("CHANGE")
                        addToList(image: vm.image ?? UIImage())
                        removeUnneadedPicture = false
                    })
                    .alert("Error", isPresented: $vm.showCameraAlert, presenting: vm.cameraError, actions: {
                        cameraError in
                        cameraError.button
                    }, message: {
                        cameraError in
                        Text(cameraError.message)
                    })
                    
                }
           

                
                NavigationLink(destination: ExportPreview(listEntry: listEntry).onAppear(perform: {
                    save()
                })) {
                    Text("Zur Zusammenfassung!")
             
                }.navigationBarBackButtonHidden(true)

            }

            }.navigationTitle("Information")
 
        }
    
    
    func save()
    {
        print("IN save")
        let plant = FieldInformation(context: moc)
        plant.listEntry = listEntry
        plant.bloomAspect = "DEINE MUM"
        
  
        
        do{
            try moc.save()
            
        }
        catch
        {
            print("ERROR")
        }
        
        
        
        
        
    }
        
    func addToList(image : UIImage){
        let newImage = partFieldArea(picuture: image)
        viewModelPicutre.pictures.append(newImage)
    }
    
    }

