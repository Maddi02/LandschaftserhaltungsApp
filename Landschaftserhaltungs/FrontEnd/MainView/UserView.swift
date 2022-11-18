//
//  UserView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 18.11.22.
//

import SwiftUI

struct ProfileImage
{
    var imageName: String
       
       var body: some View {
           Image(imageName)
               .resizable()
               .frame(width: 100, height: 100)
               .clipShape(Circle())
       }
}



struct UserView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var selectedLanguage = "Deutsch"
    @Environment(\.dismiss) var dismiss
    let language = ["Deutsch", "Latein"]
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
                           Text("Vorname")
                           Spacer(minLength: 100)
                           Text("Maddi")
                       }
                       HStack {
                           Text("Nachname")
                           Spacer(minLength: 100)
                           Text("Hummel")
                       }
                   }
                   Section(header: Text("Sprache")) {
        
                       Section {
                           Picker("Planzennamen", selection: $selectedLanguage) {
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
                   
                   
                   Button("Save"){
                       dismiss()
                       print("Button Saved was pressed")
                   }
               }.navigationBarTitle(Text("Profile"))
           }
       }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
