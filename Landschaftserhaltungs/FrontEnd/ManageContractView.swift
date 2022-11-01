//
//  manageContractView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 18.10.22.
//

import SwiftUI
import CoreData
import Foundation
import SwiftUI
import MapKit

struct ManageContractView: View {
    let formatter = DateFormatter()
    let date = Date()
    @ObservedObject private var dataHandler = DataHandler()
    @State private var showingSheet = false
    @Environment(\.managedObjectContext) var moc
    @State private var showingAlert = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Verträge Verwaltung").font(.title2)
            
            Button {
                showingSheet.toggle()
                
            }label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                
            }.frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing, 30)
                .sheet(isPresented: $showingSheet) {
                    SelectFilterView(dataHandler: dataHandler)
                    
                }.frame(alignment: .trailing)
            GeometryReader { geometry in
                ScrollView()
                {
                    
                    
                    List {
                        
                        ForEach(dataHandler.filteredContracts, id: \.self)
                        {
                            filteredContracts in
                            
                            NavigationLink(destination: EditContractView(appContract: filteredContracts, contractTerminatation: filteredContracts.contractTermination ?? Date(), dataHandler: dataHandler )) {
                                
                                ContractListItem(firstName: filteredContracts.firstName ?? "Unknown", lastName: filteredContracts.lastName , operationNumber: filteredContracts.operationNumber ?? "Unknown", contractTermination:  filteredContracts.contractTermination?.toString() ?? Date().toString(), endOfContract: filteredContracts.contractTermination?.getEndOfContract(date: filteredContracts.contractTermination ?? Date()) ?? Date().toString() , image: filteredContracts.picture ?? UIImage(imageLiteralResourceName: "HFULogo"))
                                
                            }.frame(maxWidth: .infinity)
                            
                            
                        } .onDelete(perform: delete).alert("Vertrag wurde gelöscht", isPresented: $showingAlert) {
                            
                        }
                        
                    }.frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading
                    ).ignoresSafeArea(.all)
                        .frame(width: (geometry.size.width), height: geometry.size.height, alignment: .center)
                    
                }.refreshable {
                    
                    dataHandler.fetchAppContract()
                }
                
                
            }.frame(maxWidth: .infinity)
        }
    }
    
    
    func delete(at offsets : IndexSet )
    {
        showingAlert = true
        for offset in offsets{
            let item = dataHandler.appContractList[offset]
            dataHandler.appContractList.remove(atOffsets: offsets)
            moc.delete(item)
            
            
            do{
                try moc.save()
                
                
            } catch{
                
            }
        }
    }
}

struct ManageContractView_Previews: PreviewProvider {
    static var previews: some View {
        ManageContractView()
    }
}
