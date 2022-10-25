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
    var image : UIImage
    var body: some View {
        
        HStack(){
            Image(uiImage: image).resizable().scaledToFit()
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
    
    init(firstName: String, lastName : String, operationNumber: String , contractTermination : String, endOfContract : String , image : UIImage) {
        self.firstName = firstName
        self.lastName = lastName
        self.operationNumber = operationNumber
        self.contractTermination = contractTermination
        self.endOfContract = endOfContract
        self.image = image
    }
}

struct CustomText_Preview: PreviewProvider{
    let formatter = DateFormatter()
    let date = Date()
    static var previews: some View{
        
        CustomText(firstName: "Rafael", lastName: "Raguci", operationNumber: "187361", contractTermination:  Date().toString(), endOfContract: Calendar.current.date(byAdding: .year, value: 5, to: Date())!.toString() , image: UIImage(imageLiteralResourceName: "HFULogo"))
    }
}
 


struct ManageContractView: View {
    let formatter = DateFormatter()
    let date = Date()
     private var manageContractModel = ManageContractModel()
    private var test1 : [AppContract]
    let request : NSFetchRequest<AppContract> = NSFetchRequest(entityName: "AppContract")
    @Environment(\.managedObjectContext) var moc
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
                    
                            NavigationView {
                                
                                List {
                                    
                                    ForEach(test1, id: \.self)
                                    {
                                        test1 in
                                        
                                        NavigationLink(destination: Text("Second view")) {
                                            CustomText(firstName: test1.firstName ?? "Unknown", lastName: test1.lastName ?? "Unknown", operationNumber: test1.operationNumber ?? "Unknown", contractTermination:  test1.contractTermination?.toString() ?? Date().toString(), endOfContract: Calendar.current.date(byAdding: .year, value: 5, to: test1.contractTermination ?? Date())!.toString(), image: test1.picture ?? UIImage(imageLiteralResourceName: "HFULogo"))
                                        }.frame(maxWidth: .infinity)
                                        
                                    }.onDelete(perform: deleteEntry)
                                }.frame(
                                    minWidth: 0,
                                    maxWidth: .infinity,
                                    minHeight: 0,
                                    maxHeight: .infinity,
                                    alignment: .topLeading
                                ).ignoresSafeArea(.all)
                            
                        
                    }.frame(width: (geometry.size.width), height: geometry.size.height, alignment: .center)
                      //  .fullBackground(imageName: "NatureLaunch")
              
                }
            
            }.frame(maxWidth: .infinity)
        }
    }
    func deleteEntry(at offsets : IndexSet)
    {
        for offset in offsets{
            let book = test1[offset]
            moc.delete(book)
        }
        
        try? moc.save()
    }
}

struct ManageContractView_Previews: PreviewProvider {
    static var previews: some View {
        ManageContractView()
    }
}
