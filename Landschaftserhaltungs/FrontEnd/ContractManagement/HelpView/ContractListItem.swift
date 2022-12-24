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
                Text("Inhaber").italic().font(.system(size: 14))
                Text("\(firstName) \(lastName)").font(.system(size: 14))
                Text("Vertragsnummer").italic().font(.system(size: 14))
                Text("\(operationNumber)").font(.system(size: 14))
                Text("Abschlussdatum").italic().font(.system(size: 14))
                Text("\(contractTermination)").font(.system(size: 14))
                Group{
                    Text("Ende des Vertrags").italic().font(.system(size: 14))
                    Text("\(endOfContract)").font(.system(size: 14))
                    Text("Frist").italic().font(.system(size: 14))
                    Text("\(deadline)").font(.system(size: 14))
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

