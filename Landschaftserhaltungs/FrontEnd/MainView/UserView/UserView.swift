//
//  UserView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 18.11.22.
//

import SwiftUI
import Foundation


enum PhotoQuality: Double, CaseIterable, Identifiable
{
    case low = 0.5
    case medium = 0.75
    case high = 1
    var id: Self {self}
}


struct UserView: View {

    @ObservedObject var userSettings = UserSettings()
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var logo : UIImage = UIImage()
    @State private var profileUser = Profile ()
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    static let defaults = UserDefaults.standard
    let language = ["Deutsch", "Latein"]
    @State private var isShownPhotoLibrary = false
    @State private var image = UIImage()
    @State private var csvData : String = (defaults.string(forKey: "csvData") ?? "FUCK NYOU")
    @State private var csvURL : URL = URL(filePath: "")
    @State private var openFile = false
    @State private var fileUrl = ""
    @State private var selectedPhotoQuality: PhotoQuality = .high
    @State private var fileContent = ""
    @State private var showDocumentPicker = false



    
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
                    print("HHHH")
                    self.image = userSettings.getImage()
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

              
              
                Section(header: Text("CSV")){
                    Button()
                    {
                        showDocumentPicker.toggle()
                        print(csvData)
                    }label: {
                        Text("Wähle ein CSV Datei aus")
                    }.sheet(isPresented: $showDocumentPicker)
                    {
                        DocumentPickerCSV(content: self.$csvData, urlCSV: self.$csvURL)
                    }
                    Text(UserView.defaults.string(forKey: "csvICloud") ?? "Keine CSV Datei importiert")
                    //Text(csvURL.absoluteString)
                }

                Section(header: Text("Fotoqualität")){
                    Picker("Fotoqualität", selection: $selectedPhotoQuality){
                        Text("hoch").tag(PhotoQuality.high)
                        Text("mittel").tag(PhotoQuality.medium)
                        Text("niedrig").tag(PhotoQuality.low)
                    }.onAppear{selectedPhotoQuality = PhotoQuality(rawValue: UserView.defaults.double(forKey: "photoQuality")) ?? .high}
                }
                
                
                Section(header: Text("Onboarding")){
                    NavigationLink(destination: OnboardingFlowView(), label: {
                        Text("Onboarding wiederholen")
                        
                    }).onAppear(perform: {
                        UserView.defaults.set(false, forKey: "realOnboarding")
                    })
                }
                
                Button("Sichern")
                {
                    UserView.defaults.set(selectedPhotoQuality.rawValue, forKey: "photoQuality")
                    userSettings.saveImage(image: self.image)
                    UserView.defaults.set(csvData, forKey: "csvData")
                    
                    print("PRINT \(csvData)")
                    dismiss()
                    print("Button Saved was pressed")
                }
                
                
            }.navigationBarTitle(Text("Mein Profil"))

        }
        .sheet(isPresented: $isShownPhotoLibrary){
            ImagePicker(changePicture: false,  sourceType: .photoLibrary, selectedImage: self.$image)
        }
    }
    

}

