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
    var editContract = EditContractModel()
    var body: some View {
        TextField(appContract.lastName ?? "NO Data", text: $newContractDataModel.lastName)
        Button{
            editContract.upi(appContract: appContract, contractDataModel: newContractDataModel)
            presentationMode.wrappedValue.dismiss()
            EditContractModel()
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
