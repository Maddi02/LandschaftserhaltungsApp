//
//  EditContract.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 25.10.22.
//

import SwiftUI
import CoreData
struct EditContract: View {
    
    var appContract : AppContract
    @StateObject var newContractDataModel = NewContractDataModel()

    var body: some View {
        TextField(appContract.lastName ?? "NO Data", text: $newContractDataModel.lastName)
        Button{
            print("PRINT \($newContractDataModel.lastName)")
            newContractDataModel.saveAll( firstName1: "Peter")
            print("Speichern des Vertrage = TODO")
            
        }
    label: {
        HStack {
            
            Text("Speichern")
        }
    }
    }
}
/*
struct EditContract_Previews: PreviewProvider {
    static var previews: some View {
        EditContract()
    }
}
*/
