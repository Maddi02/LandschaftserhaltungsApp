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
    
    @Environment(\.managedObjectContext) var moc
    @State private var showingAlert = false
    @State static private var delteOK = false
    @State private var showingNavView = false
    @State private var test = [AppContract]()
  
    
    init()
    {
        // dataHandler.getEntrys()
    }

    
    static func aa()
    {
        
        delteOK.toggle()
        print("HHHHH")
    }
    
    public  var buttonAction: ()->Void {
         {
             print("Button tapped!!")
             dataHandler.fetchAppContract()
         }
     }
    
    var body: some View {
  
        VStack(alignment: .leading){
            Text("Verträge Verwaltung").font(.title2)
                GeometryReader { geometry in
                    ScrollView()
                    {
                    
                            
                                List {
                                    
                                    ForEach(dataHandler.appContractList, id: \.self)
                                    {
                                        test1 in
    
                                        NavigationLink(destination: EditContract(appContract: test1, dataHandler: dataHandler)) {
                                           
                                            ContractListItem(firstName: test1.firstName ?? "Unknown", lastName: test1.lastName , operationNumber: test1.operationNumber ?? "Unknown", contractTermination:  test1.contractTermination?.toString() ?? Date().toString(), endOfContract: test1.contractTermination?.getEndOfContract(date: test1.contractTermination ?? Date()) ?? Date().toString() , image: test1.picture ?? UIImage(imageLiteralResourceName: "HFULogo"))
                                            
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
                      //  .fullBackground(imageName: "NatureLaunch")
              
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
