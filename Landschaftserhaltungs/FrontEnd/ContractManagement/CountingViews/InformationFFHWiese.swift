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
    @State private var contractTarget  : String = ""
    @State private var adaptationEditions  : String = ""
    @State private var furtherMaintenanceMeasures  : String = ""
    @State private var showingActionSheet = false
    @State private var goToConclusion = true
    @State private var saveIsEnabled = false
    
    
    
    
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
                        showingActionSheet.toggle()
                    }, label: {
                        
                        HStack{
                            Text("Bilder auswählen")
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
           

               
                VStack{

               
                    Button("Speichern") {
                        save()
                        NavigationUtil.popToRootView()
                          }.frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .listRowBackground(Color.blue)
                    
                    
                    
                }
                
                


            }.navigationBarBackButtonHidden(true)

            }.navigationTitle("Information").navigationBarBackButtonHidden(true)
            .onTapGesture {
                UIApplication.shared.endEditing()
                    }
 
        }
    
    
    func save()
    {
        print("IN save")
        let plant = FieldInformation(context: moc)
        plant.listEntry = listEntry
        plant.bloomAspect = bloomAspect
        plant.dataOfTaking = dataOfTaking
        plant.farming = farming
        plant.position = position
        plant.vegetationDescription = vegetationDescription
        plant.evaluationSpeciesInventory = evaluationSpeciesInventory
        plant.assessmentHabitatStructure = assessmentHabitatStructure
        plant.ratingImpairment = ratingImpairment
        plant.protectionStatus = protectionStatus
        plant.overallAssessmentOfTheStateOfPreservation = overallAssessmentOfTheStateOfPreservation
        plant.faunisticObservation = faunisticObservation
        plant.contractTarget = contractTarget
        plant.adaptationEditions = adaptationEditions
        plant.furtherMaintenanceMeasures = furtherMaintenanceMeasures
        
       // print ("Picute array size \(viewModelPicutre.pictures.count)")
        

        for i in viewModelPicutre.pictures{
            let a = PicutreList(context: moc)
            a.listOfPictures = plant
            a.compareString = " "
            a.picutre = i.picuture
        }
      
        
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
    
    func toImageList() ->[UIImage]
    {
        var list : [UIImage] = []
        
        for i in  viewModelPicutre.pictures
        {
            list.append(i.picuture)
        }
        
        return list
    }
    
    
    }

