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

struct SheetView: View {

    @Environment(\.dismiss) var dismiss
    @ObservedObject  var dataHandler : DataHandler
    var body: some View {
        Text("Wähle die Sortierung aus").font(.title).padding()
        List {
           
                Button("zuletzt hinzugefügt") {
                    dataHandler.filter = .none
                    dismiss()
                }
                Button("bald auslaufende Verträge") {
                    dataHandler.filter = .date
                    dismiss()
                }
                Button("nach Fristen") {
                    
                    dataHandler.filter = .none
                    dismiss()
                }
                Button("Press to dismiss") {
                    dismiss()
                }
                
                
            }
        
        
       
    }
}





struct ManageContractView: View {
    let formatter = DateFormatter()
    let date = Date()
    @ObservedObject private var dataHandler = DataHandler()
    @State private var showingSheet = false
    @Environment(\.managedObjectContext) var moc
    @State private var showingAlert = false
    @State static private var delteOK = false
    @State private var showingNavView = false
    @State private var test = [AppContract]()
  


    
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
            Button("Button title") {
                showingSheet.toggle()
                
            }.sheet(isPresented: $showingSheet) {
                SheetView(dataHandler: dataHandler)
            }
                GeometryReader { geometry in
                    ScrollView()
                    {
                    
                            
                                List {
                                    
                                    ForEach(dataHandler.filteredContracts, id: \.self)
                                    {
                                        test1 in
    
                                        NavigationLink(destination: EditContract(appContract: test1, dataHandler: dataHandler, contractTerminatation: test1.contractTermination ?? Date())) {
                                           
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
