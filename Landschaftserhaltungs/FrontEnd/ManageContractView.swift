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
struct CustomText: View {
    var firstName: String
    var lastName: String
    var operationNumber: String
    var contractTermination: String
    var endOfContract: String

    var body: some View {
       // Image(systemName: "HFULogo")
        HStack(){
            VStack(alignment: .leading)
            {
               Text("Inhaber")
               Text("\(firstName) \(lastName)")
                Text("Vertragsnummer")
                Text("\(operationNumber)")
                Text("Abschlussdatum")
                Text("\(contractTermination)")
                Group{
                    Text("Ende des Vertrags")
                    Text("\(endOfContract)")
                }
            }.frame(maxWidth: .infinity, alignment: .center)
        }.frame(maxWidth: .infinity, alignment: .leading)
        
       
        
    }
    
    init(firstName: String, lastName : String, operationNumber: String , contractTermination : String, endOfContract : String ) {
        self.firstName = firstName
        self.lastName = lastName
        self.operationNumber = operationNumber
        self.contractTermination = contractTermination
        self.endOfContract = endOfContract
    
    }
}

struct CustomText_Preview: PreviewProvider{
    let formatter = DateFormatter()
    let date = Date()
    static var previews: some View{
        
        CustomText(firstName: "Rafael", lastName: "Raguci", operationNumber: "187361", contractTermination:  Date().toString(), endOfContract: Calendar.current.date(byAdding: .year, value: 5, to: Date())!.toString())
    }
}
 



struct ManageContractView: View {
    let formatter = DateFormatter()
    let date = Date()
     private var manageContractModel = ManageContractModel()
    private var test1 : [AppContract]
    let request : NSFetchRequest<AppContract> = NSFetchRequest(entityName: "AppContract")
    init()
    {
        print("Hello", terminator: "")
        test1 = manageContractModel.getEntrys()
    }
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Verträge Verwaltung").font(.title2)
            
            ScrollView()
            {
                LazyVStack(spacing: 10){
                
                    ForEach(test1, id: \.self)
                    {
                        test1 in
                        CustomText(firstName: test1.firstName ?? "Unknown", lastName: test1.lastName ?? "Unknown", operationNumber: test1.operationNumber ?? "Unknown", contractTermination:  test1.contractTermination?.toString() ?? Date().toString(), endOfContract: Calendar.current.date(byAdding: .year, value: 5, to: test1.contractTermination ?? Date())!.toString())
                    }
                }
            }.frame(maxWidth: .infinity)
        }
    }
}

struct ManageContractView_Previews: PreviewProvider {
    static var previews: some View {
        ManageContractView()
    }
}
