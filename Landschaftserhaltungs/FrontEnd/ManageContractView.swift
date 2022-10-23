//
//  manageContractView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 18.10.22.
//

import SwiftUI


struct CustomText: View {
    let text: String
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        self.text = text
    }
    
}



struct ManageContractView: View {
    
    init()
    {
        print("Hello", terminator: "")
       
    }
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Verträge Verwaltung").font(.title2)
            
            
            ScrollView()
            {
                LazyVStack(spacing: 10){
                    ForEach(0..<100) {
                        CustomText(text: "Item \($0)")
                            .font(.title)
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
