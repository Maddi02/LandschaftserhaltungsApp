//
//  ContractListItem.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 25.10.22.
//

import SwiftUI

struct ContractListItem: View {
    var firstName: String
    var lastName: String
    var operationNumber: String
    var contractTermination: String
    var endOfContract: String
    var deadline: String
    var image : UIImage
    var dataHandler : DataHandler
    
    var body: some View {
        
        HStack(){
            Image(uiImage: image).resizable().scaledToFit().padding(.leading)
            VStack(alignment: .leading)
            {
                Text("Inhaber")
                Text("\(firstName) \(lastName)")
                Text("Vertragsnummer")
                Text("\(operationNumber)")
                Text("Abschlussdatum")
                Text("\(contractTermination)")
                Group{
                    Text("Ende des Vertrags")
                    Text("\(endOfContract)")
                    Text("First")
                    Text("\(deadline)")
                }
            }.frame(maxWidth: .infinity, alignment: .center)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    init(firstName: String, lastName : String, operationNumber: String , contractTermination : String, endOfContract : String , image : UIImage, deadline : String, dataHandler : DataHandler ) {
        self.firstName = firstName
        self.lastName = lastName
        self.operationNumber = operationNumber
        self.contractTermination = contractTermination
        self.endOfContract = endOfContract
        self.image = image
        self.deadline = deadline
        self.dataHandler = dataHandler
    }
}

