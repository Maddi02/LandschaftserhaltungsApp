//
//  createNewContract.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 18.10.22.
//

import Foundation
import SwiftUI
import MapKit

class Model: ObservableObject {

    @Published var firstName: String = ""
    
    @Published var lastNames: String = ""

    @Published var birthday: Date = Date()

    @Published var street: String = ""

    @Published var PLZName: String = ""

    @Published var addressSecondLine: String = ""

    @Published var PLZ: String = ""

    @Published var Land: String = ""
}

struct CreateNewContract : View
{
    @State var firstName: String = ""
    @State var lastName: String = ""
    @ObservedObject var model = Model()
    @State var birthdate = Date()
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
                        TextField("Vorgangsnummer", text: $model.street)
                        TextField("Vertragszweck", text: $model.PLZName,axis: .vertical)
                        TextField("Maßnahmen", text: $model.PLZ,axis: .vertical)
                        TextField("Bewirtschaftungsauflagen", text: $model.Land,axis: .vertical)
                        TextField("Besonderheiten", text: $model.Land,axis: .vertical)
                    }

                }
                .navigationBarTitle(Text("Neuen Vertrag anlegen"))
                
            }
        }
        
        
    }
}
    
    

