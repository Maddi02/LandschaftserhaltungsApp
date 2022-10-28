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
 
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var dataHandler = DataHandler()
    var body: some View {
        TextField(appContract.lastName , text: $newContractDataModel.lastName)
        Button{
            dataHandler.upi(appContract: appContract, contractDataModel: newContractDataModel)
            presentationMode.wrappedValue.dismiss()
        
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
