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
    private var dataHandler = DataHandler()
    private var appContractList : [AppContract]
    @Environment(\.managedObjectContext) var moc
    init()
    {
        appContractList = dataHandler.getEntrys()
    }
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Verträge Verwaltung").font(.title2)

                GeometryReader { geometry in
                    ScrollView()
                    {
                    
                            
                                List {
                                  
                                    ForEach(appContractList, id: \.self)
                                    {
                                        test1 in
    
                                        NavigationLink(destination: EditContract(appContract: test1).onAppear {
                                            
                                        }) {
                                           
                                            ContractListItem(firstName: test1.firstName ?? "Unknown", lastName: test1.lastName , operationNumber: test1.operationNumber ?? "Unknown", contractTermination:  test1.contractTermination?.toString() ?? Date().toString(), endOfContract: test1.contractTermination?.getEndOfContract(date: test1.contractTermination ?? Date()) ?? Date().toString() , image: test1.picture ?? UIImage(imageLiteralResourceName: "HFULogo"))
                                            
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
            let book = appContractList[offset]
            moc.delete(book)
            
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
