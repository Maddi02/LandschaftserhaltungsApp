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
    @State private var isActiveEditing = false
    
    init()
    {
        dataHandler.fetchAppContract()
    }
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Vertragsverwaltung").font(.title2).padding(.leading)
            
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
                    NavigationStack{
                    List() {
                        
                        ForEach(dataHandler.filteredContracts, id: \.self)
                        {
                            filteredContracts in
                            NavigationLink(destination: ContractAdminister(dataHandler: dataHandler, filteredContracts: filteredContracts, description: "") )
                            {
                                ContractListItem(firstName: filteredContracts.firstName ?? "Unknown",
                                                 lastName: filteredContracts.lastName ?? "Unknwon" ,
                                                 operationNumber: filteredContracts.operationNumber ?? "Unknown",
                                                 contractTermination: String(filteredContracts.contractTermination),
                                                 endOfContract: String(filteredContracts.contractTermination + 5),
                                                 image: filteredContracts.picture ?? UIImage(imageLiteralResourceName: "HFULogo"),
                                                 deadline: filteredContracts.deadline?.toString() ?? Date().toString(), dataHandler: dataHandler).swipeActions(edge: .leading) {
                                    

                                        NavigationLink(destination: EditContractView(appContract: filteredContracts, contractTermination: Int(filteredContracts.contractTermination), contractDeadline: filteredContracts.deadline ?? Date(), dataHandler: dataHandler)) {
                               
                                     
                                            HStack(spacing: 0) {
                                                Text("Vertrag bearbeiten")
                                                Image(systemName: "slider.horizontal.2.square.on.square")
                                         
                                            }
                            
                                        }
                                        
                                }.tint(.indigo)
                                
                                
                            }.frame(maxWidth: .infinity)
                            
                            
                        } .onDelete(perform: delete).alert("Vertrag wurde gelöscht", isPresented: $showingAlert) {
                        }
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
    
    func popToRoot()
    {
        dataHandler.appContractList.removeAll()
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
