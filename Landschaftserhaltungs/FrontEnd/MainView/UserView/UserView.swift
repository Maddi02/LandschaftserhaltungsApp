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
    @State private var openFile = false
    @State private var fileUrl = ""
    
    
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
                    Button("CSV Datei importieren")
                    {
                        openFile.toggle()
                    }.fileImporter(isPresented: $openFile, allowedContentTypes: [.data]) {
                        (res) in
                        
                        do {
                            let fileUrl = try res.get()
                            self.fileUrl = fileUrl.lastPathComponent
                            defaults.set(fileUrl, forKey: "csvPath")
                        }
                        catch{
                            print(error)
                        }
                    }
                    Text(defaults.url(forKey: "csvPath")?.lastPathComponent ?? "Kein Pfad ausgewählt")
                }
                
                
                Section(header: Text("Onboarding")){
                    NavigationLink(destination: OnboardingFlowView(), label: {
                        Text("Onboarding wiederholen")
                        
                    }).onAppear(perform: {
                        defaults.set(false, forKey: "realOnboarding")
                    })
                }
                
                Button("Sichern")
                {
                    userSettings.saveImage(image: self.image)
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

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
