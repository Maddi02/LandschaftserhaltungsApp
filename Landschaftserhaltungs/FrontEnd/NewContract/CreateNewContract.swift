//
//  createNewContract.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 18.10.22.
//

import Foundation
import SwiftUI
import MapKit

struct CreateNewContract : View
{
    
    @State private var date = Date()
    @State private var isShownPhotoLibrary = false
    @State private var isShownSelectFilesFromFiles = false
    @State private var image = UIImage()
    @State private var firstName  = String()
    @State private var showActionSheet  = false
    @State private var showWheelPicker: Bool = false
    @StateObject var newContractDataModel = NewContractDataModel()
    @StateObject var dataHandler = DataHandler()
    @StateObject var appContract = AppContract()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.dismiss) private var dismiss
    @State private var fileContent = ""
    @State private var showDocumentPicker = false
    
    
    var body : some View
    {
        
        
        NavigationView {
            GeometryReader { geo in
                Form {
                    Section(header: Text("Vertragsnehmer")) {
                        
                        TextField("Vorname", text: $firstName).tag(1)
                        TextField("Nachname", text: $newContractDataModel.lastName)
                    }
                    
                    Section(header: Text("Kontakt-Adresse")) {
                        TextField("Staße", text: $newContractDataModel.street)
                        TextField("Ort", text: $newContractDataModel.PLZName)
                        TextField("PLZ", text: $newContractDataModel.PLZ).keyboardType(UIKeyboardType.numberPad)
                        TextField("Land", text: $newContractDataModel.country)
                        TextField("Mobil", text: $newContractDataModel.mobile).keyboardType(UIKeyboardType.numberPad)
                    }
                    
                    Section(header: Text("Vertragsinformationen")) {
                        HStack
                        {
                            Text("Vertragsabschluss")
                            Spacer()
                            Button(String(newContractDataModel.contractTermination))
                            {
                                showWheelPicker.toggle()
                            }
                            .buttonStyle(BorderedButtonStyle())
                            .padding(5)
                            .foregroundColor(.black)
                            .cornerRadius(5)
                        }
                        CollapsableWheelPicker(
                            "Vertragsabschluss",
                            showsPicker: $showWheelPicker,
                            selection: $newContractDataModel.contractTermination
                        ) {
                            ForEach(newContractDataModel.years, id: \.self) {
                                Text(String($0)).tag($0)
                            }
                        }
                        
                        TextField("Vorgangsnummer", text: $newContractDataModel.operationNumber)
                        TextField("Vertragszweck", text: $newContractDataModel.contractPurpose,axis: .vertical)
                        TextField("Maßnahmen", text: $newContractDataModel.measures,axis: .vertical)
                        TextField("Bewirtschaftungsauflagen", text: $newContractDataModel.managementRequirements,axis: .vertical)
                        DatePicker(selection: $newContractDataModel.deadline,
                                   displayedComponents: [.date],
                                   label: { Text("Frist") })
                    }
                    
                    Section(header: Text("Besonderheiten"))
                    {
                        TextField("Besonderheiten", text: $newContractDataModel.particularities,axis: .vertical).frame(minHeight: 50)
                    }
                    
                    
                    Section(header: Text("Karte mit Vertragsflächen")) {
                        Image(uiImage: self.image)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .edgesIgnoringSafeArea(.all)
                        
                        
                        
                        Button()
                        {
                            showActionSheet.toggle()
                        } label: {
                            HStack{
                                Image(systemName: "airplane")
                                    .font(.system(size: 20))
                                Text("Wähle eine Luftaufnahme aus")
                                   
                            } .frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }.confirmationDialog("Wähle die Bildquelle aus", isPresented: $showActionSheet, titleVisibility: .visible) {
                            
                        
                            Button()
                            {
                                showDocumentPicker.toggle()
                            }label: {
                                        Text("Wähle ein Bild aus Datein aus")
                            }
                          
                            
                            
                            
                            
                            Button {
                                self.isShownPhotoLibrary = true
                                
                            } label: {
                                HStack {
                                    HStack{
                                        Text("Wähle ein Bild aus der Galerie")
                                    }

                                }
                            }
                        }
                        .sheet(isPresented: $showDocumentPicker)
                        {
                            DocumentPicker(content: self.$image)
                        }
                    }
                    Section(header: Text("")) {
                        Button{
                            dataHandler.saveAll(image: self.image, firstName1: firstName, newContractDataModel : newContractDataModel)
                            
                            dismiss()
                        }
                    label: {
                        HStack {
                            
                            Text("Speichern")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                        
                    }
                }.navigationBarTitle(Text("Neuen Vertrag anlegen"))
            }.background(content: BackGroundGradient.getGradient)
            
        }.sheet(isPresented: $isShownPhotoLibrary){
            ImagePicker(changePicture: false, appContract: appContract,  sourceType: .photoLibrary, selectedImage: self.$image)
        }
    }
    
    public func testSet()
    {
        self.firstName = "dd"
        
    }
    
    
}



