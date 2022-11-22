//
//  UserView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 18.11.22.
//

import SwiftUI
import Foundation




struct UserView: View {
    @ObservedObject var userSettings = UserSettings()
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var logo : UIImage = UIImage()
    @State private var profileUser = Profile ()
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    let defaults = UserDefaults.standard
    
    let language = ["Deutsch", "Latein"]
    @State private var isShownPhotoLibrary = false
    @State private var image = UIImage()
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Text("Logo")

                HStack{
                    Image(uiImage: self.image)
                        .resizable()
                        .clipped()
                        .frame(width: 100, height: 100, alignment: .center)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 2.0))
                    
                    Button {
                        self.isShownPhotoLibrary = true
                        
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    
                }.onAppear(perform: {

                    loadImage()
                    
                })
                Section(header: Text("Bearbeitername")) {
                    HStack {
                        TextField("Vorname", text: $userSettings.firstName)
                        
                    }
                    HStack {
                        TextField("Nachname", text: $userSettings.lastName)
                    }
                }
                Section(header: Text("Sprache")) {
                    
                    Section {
                        Picker("Planzennamen", selection:  $userSettings.language) {
                            ForEach(language, id: \.self) {
                                Text($0).tag($0.components(separatedBy: " ")[0])
                            }
                        }
                        .pickerStyle(.menu)
                    }.frame(maxWidth: .infinity, alignment: .center)
                    
                }
                
                Button("Füge Pflanzenart hinzu"){
                    print("Add Pflanzenart")
                }
                
                
                Button("Save")
                {
                    saveImage()
                    dismiss()
                    print("Button Saved was pressed")
                }
            }.navigationBarTitle(Text("Profile"))
        }.onAppear(perform: {
            
        })
        .sheet(isPresented: $isShownPhotoLibrary){
            ImagePicker(changePicture: false,  sourceType: .photoLibrary, selectedImage: self.$image)
            
        }
    }
    
    func saveImage() {
        guard let data = self.image.jpegData(compressionQuality: 0.5) else { return }
        let encoded = try! PropertyListEncoder().encode(data)
        UserDefaults.standard.set(encoded, forKey: "KEY")
    }
    
    func loadImage() {
        guard let data = UserDefaults.standard.data(forKey: "KEY") else { return }
        let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
        let image = UIImage(data: decoded)
        self.image = image ?? UIImage()
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
