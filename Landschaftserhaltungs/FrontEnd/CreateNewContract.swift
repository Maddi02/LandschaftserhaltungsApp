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
    
    @State private var isShownPhotoLibrary = false
    @State private var image = UIImage()
    @ObservedObject var newContractDataModel = NewContractDataModel()
    
    var body : some View
    {
        
        NavigationView {
            GeometryReader { geo in
                Form {
                    Section(header: Text("Vertragsnehmer")) {
                        TextField("Vorname", text: $newContractDataModel.firstName)
                        TextField("Nachname", text: $newContractDataModel.lastName)
                    }
                    
                    Section(header: Text("Kontakt-Adresse")) {
                        TextField("Staße", text: $newContractDataModel.street)
                        TextField("Ort", text: $newContractDataModel.PLZName)
                        TextField("PLZ", text: $newContractDataModel.PLZ).keyboardType(UIKeyboardType.numberPad)
                        TextField("Land", text: $newContractDataModel.country)
                        TextField("Mobil", text: $newContractDataModel.country)
                    }
                    
                    Section(header: Text("Vertragsinformationen")) {
                        DatePicker(selection: $newContractDataModel.contractTermination,
                                   displayedComponents: [.date],
                                   label: { Text("Vertragsabschluss") })
                        TextField("Vorgangsnummer", text: $newContractDataModel.operationNumber)
                        TextField("Vertragszweck", text: $newContractDataModel.contractPurpose,axis: .vertical)
                        TextField("Maßnahmen", text: $newContractDataModel.measures,axis: .vertical)
                        TextField("Bewirtschaftungsauflagen", text: $newContractDataModel.managementRequirements,axis: .vertical)
                        
                    
                        
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
                        
                        Button {
                            self.isShownPhotoLibrary = true
                            
                        } label: {
                            HStack {
                                HStack{
                                    Image(systemName: "photo")
                                        .font(.system(size: 20))
                                    Text("Wähle ein Bild aus der Galerie aus")
                                }
                                .frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal)
                            }
                        }
                    }
                    Section(header: Text("")) {
                        Button{
                            
               
                            newContractDataModel.saveAll(image: self.image)
                            print("Speichern des Vertrage = TODO")
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
                        Button{
                            print("Sollte ein Feldbegehungsformular öffnen")
                        }
                    label: {
                        HStack {
                            Text("Hinzufügen einer Feldbegehung")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    }
                }.navigationBarTitle(Text("Neuen Vertrag anlegen"))
            }
            
        }.sheet(isPresented: $isShownPhotoLibrary){
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)

        }
    }
}



