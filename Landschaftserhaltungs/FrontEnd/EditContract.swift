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
    var dataHandler : DataHandler
    @StateObject var newContractDataModel = NewContractDataModel()
     var manageContractView = ManageContractView()

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        TextField(appContract.lastName , text: $newContractDataModel.lastName)
        Button{
            dataHandler.upi(appContract: appContract, contractDataModel: newContractDataModel)
            dataHandler.fetchAppContract()
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
