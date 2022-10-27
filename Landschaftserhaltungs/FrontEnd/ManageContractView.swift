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
    private var manageContractModel = ManageContractModel()
    private var test1 : [AppContract]
    let request : NSFetchRequest<AppContract> = NSFetchRequest(entityName: "AppContract")
    @Environment(\.managedObjectContext) var moc
    @State private var searchText = ""
    init()
    {
        print("Hello", terminator: "")
        test1 = manageContractModel.getEntrys()
    }
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Verträge Verwaltung").font(.title2)
           
                GeometryReader { geometry in
                    ScrollView()
                    {
                    
                            
                                List {
                                  
                                    ForEach(test1, id: \.self)
                                    {
                                        test1 in
                                        
                                        NavigationLink(destination: EditContract(appContract: test1).onAppear {
                                            
                                        }) {
                                           
                                            ContractListItem(firstName: test1.firstName ?? "Unknown", lastName: test1.lastName ?? "Unknown", operationNumber: test1.operationNumber ?? "Unknown", contractTermination:  test1.contractTermination?.toString() ?? Date().toString(), endOfContract: Calendar.current.date(byAdding: .year, value: 5, to: test1.contractTermination ?? Date())!.toString(), image: test1.picture ?? UIImage(imageLiteralResourceName: "HFULogo"))
                                            
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
            let book = test1[offset]
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
