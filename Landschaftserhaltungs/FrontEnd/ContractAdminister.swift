//
//  ContractAdminister.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 02.11.22.
//

import SwiftUI

struct ContractFieldItem
{
    enum TypeOfField{
        case meadow,other
    }
    
    var name:  String
    var dateOfTour: Date
    var fieldTyp : TypeOfField
    var countedPlants : Int
}



struct ContractAdminister: View {
    
    @State var filteredContracts : AppContract
    var body: some View {
        Text("Vetragsübersicht").font(.title2).frame(maxWidth: .infinity, alignment: .leading)
        ContractListItem(firstName: filteredContracts.firstName ?? "Unknown", lastName: filteredContracts.lastName , operationNumber: filteredContracts.operationNumber ?? "Unknown", contractTermination:  filteredContracts.contractTermination?.toString() ?? Date().toString(), endOfContract: filteredContracts.contractTermination?.getEndOfContract(date: filteredContracts.contractTermination ?? Date()) ?? Date().toString() , image: filteredContracts.picture ?? UIImage(imageLiteralResourceName: "HFULogo"), deadline: filteredContracts.deadline?.toString() ?? Date().toString()).frame(maxWidth: .infinity, alignment: .top)
        
        Text("Vetragsflächen:").font(.title2).frame(maxWidth: .infinity, alignment: .leading)

        
        
    }
}

