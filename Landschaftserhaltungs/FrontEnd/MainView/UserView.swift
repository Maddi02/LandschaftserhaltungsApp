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
    @State private var selectedLanguage = "Deutsch"
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    let defaults = UserDefaults.standard
    @State private var index = UserDefaults.standard.integer(forKey: "language")
    
    let language = ["Deutsch", "Latein"]
    
    
    init()
    {
        print(selectedLanguage)
        selectedLanguage = UserDefaults.standard.string(forKey: "language") ?? "German"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Text("Logo")
                
                
                HStack{
                    Image("here should be an picure")
                        .resizable()
                        .clipped()
                        .frame(width: 100, height: 100, alignment: .center)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 2.0))
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    
                }
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
                        }.onChange(of: index) { newValue in
                            // Run code to save
                            UserDefaults.standard.set(newValue, forKey: "language")
                        }
                        .pickerStyle(.menu)
                    }.frame(maxWidth: .infinity, alignment: .center)
                    
                }
                
                Button("Füge Pflanzenart hinzu"){
                    print("Add Pflanzenart")
                }
                
                
                Button("Save")
                {
                    
                    print(selectedLanguage)
                    defaults.set(selectedLanguage, forKey: "language")

                    dismiss()
                    print("Button Saved was pressed")
                }
            }.navigationBarTitle(Text("Profile"))
        }.onAppear(perform: {
            
        })
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
