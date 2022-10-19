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
    @ObservedObject var model = NewContractDataModel()
    var body : some View
    {
        
        NavigationView {
            GeometryReader { geo in
                Form {
                    Section(header: Text("Name")) {
                        TextField("Vorname", text: $model.firstName)
                        TextField("Nachname", text: $model.lastNames)
                    }
                    Section(header: Text("Persönliche Informationen")) {
                        DatePicker(selection: $model.birthday,
                                   displayedComponents: [.date],
                                   label: { Text("Geburtstag") })
                        
                    }
                    Section(header: Text("Addresse")) {
                        TextField("Staße", text: $model.street)
                        TextField("Ort", text: $model.PLZName)
                        TextField("PLZ", text: $model.PLZ)
                        TextField("Land", text: $model.Land)
                    }
                    
                    Section(header: Text("Vertragsinformationen")) {
                        TextField("Vorgangsnummer", text: $model.operationNumber)
                        TextField("Vertragszweck", text: $model.contractPurpose,axis: .vertical)
                        TextField("Maßnahmen", text: $model.measures,axis: .vertical)
                        TextField("Bewirtschaftungsauflagen", text: $model.managementRequirements,axis: .vertical)
                        TextField("Besonderheiten", text: $model.particularities,axis: .vertical)
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
                                .frame(minWidth: 0, maxWidth: .infinity , minHeight: 0 , maxHeight: 50)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .padding(.horizontal)
                            }
                        }
                    }
                    Section(header: Text("Actionen")) {
                        Button{
                            print("Speichern des Vertrage = TODO")
                        }
                    label: {
                        HStack {
                            Text("Speichern")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity , minHeight: 0 , maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                    }
                        
                        
                        Button{
                            print("Sollte ein Feldbegehungsformular öffnen")
                        }
                    label: {
                        HStack {
                            Text("Hinzufügen einer Feldbegehung")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity , minHeight: 0 , maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
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



