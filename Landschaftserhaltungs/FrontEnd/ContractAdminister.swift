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
    @Environment(\.dismiss) var dismiss
    @ObservedObject var dataHandler : DataHandler
    @State var filteredContracts : AppContract
    @State private var showingOptions = false
    @State private var selection = "None"
    
    var body: some View {
        Text("Vetragsübersicht").font(.title2).frame(maxWidth: .infinity, alignment: .leading)
        ContractListItem(firstName: filteredContracts.firstName ?? "Unknown", lastName: filteredContracts.lastName , operationNumber: filteredContracts.operationNumber ?? "Unknown", contractTermination:  filteredContracts.contractTermination?.toString() ?? Date().toString(), endOfContract: filteredContracts.contractTermination?.getEndOfContract(date: filteredContracts.contractTermination ?? Date()) ?? Date().toString() , image: filteredContracts.picture ?? UIImage(imageLiteralResourceName: "HFULogo"), deadline: filteredContracts.deadline?.toString() ?? Date().toString()).frame(maxWidth: .infinity, alignment: .top)
        
        
        
        VStack{
            Text("Vetragsflächen:").font(.title2).frame(maxWidth: .infinity, alignment: .leading)
            Button(action: {
                showingOptions.toggle()
                addRow()
            }){
                Image(systemName: "plus")
            }.frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing,30).padding(.bottom,10) .sheet(isPresented: $showingOptions)
            {
                CreateNewPerpetration(dataHandler: dataHandler)
            }
                
                
            }
            List()
            {
                ForEach(dataHandler.test, id: \.self)
                {
                    filteredContracts in
                    ListItemContractArea()
                }
            }
        }
        private func addRow() {
        
            print("Size: \(dataHandler.listItemContractArea.count)")
        }
    }
    
