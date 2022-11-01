//
//  expieredContractView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 18.10.22.
//

import SwiftUI

struct ExpiredContractView: View {
    
    
    private var dataHandler = DataHandler()
    private var appContractListASC : [AppContract]
    @Environment(\.managedObjectContext) var moc
    init(){
        
        appContractListASC = dataHandler.sortByDateASC()
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Verträge Verwaltung").font(.title2)
            
            GeometryReader { geometry in
                ScrollView()
                {
                    
                    
                    List {
                        
                        ForEach(appContractListASC, id: \.self)
                        {
                            appContractListASC in
                            
                            NavigationLink(destination: EditContractView(appContract: appContractListASC, contractTerminatation: appContractListASC.contractTermination ?? Date(), dataHandler: dataHandler).onAppear {
                                
                            }) {
                                
                                ContractListItem(firstName: appContractListASC.firstName ?? "Unknown", lastName: appContractListASC.lastName , operationNumber: appContractListASC.operationNumber ?? "Unknown", contractTermination:  appContractListASC.contractTermination?.toString() ?? Date().toString(), endOfContract: Date().getLastYear().toString() , image: appContractListASC.picture ?? UIImage(imageLiteralResourceName: "HFULogo"))
                                
                            }.frame(maxWidth: .infinity)
                            
                            
                        }.onDelete(perform: delete)
                        
                    }.frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading
                    ).ignoresSafeArea(.all)
                    
                    
                        .frame(width: (geometry.size.width), height: geometry.size.height, alignment: .center)
                    //  .fullBackground(imageName: "NatureLaunch")
                    
                }
                
            }.frame(maxWidth: .infinity)
        }
    }
    
    
    func delete(at offsets : IndexSet)
    {
        
        for offset in offsets{
            let book = appContractListASC[offset]
            moc.delete(book)
            
            
            do{
                try moc.save()
                
            } catch{
                
            }
        }
        
        
    }
    
}
