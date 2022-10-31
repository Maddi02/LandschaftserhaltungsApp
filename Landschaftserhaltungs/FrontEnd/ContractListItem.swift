//
//  ContractListItem.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 25.10.22.
//

import SwiftUI

struct ContractListItem: View {
    


    
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

struct ContractListItem_Preview: PreviewProvider{
    
    let lastOfYear : Int

    let formatter = DateFormatter()
    let date = Date()
    let year1 = Calendar.current.component(.year, from: Date())
    let firstOfNextYear = Calendar.current.date(from: DateComponents(year: 2020 + 1, month: 1, day: 1))
    static var previews: some View{
     
         Text("HHello")
     /*
        ContractListItem(firstName: "Rafael", lastName: "Raguci", operationNumber: "187361", contractTermination:  Date().toString(), endOfContract: Calendar.current.date(byAdding: .day, value: -1, to: firstOfNextYear ?? Date())?.toString() ?? Date().toString() , image: UIImage(imageLiteralResourceName: "HFULogo"))
      */
    }
}
