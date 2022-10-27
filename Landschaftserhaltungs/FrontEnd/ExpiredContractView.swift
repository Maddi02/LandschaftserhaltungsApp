//
//  expieredContractView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 18.10.22.
//

import SwiftUI

struct ExpiredContractView: View {
    
    
    private var newContractDataModel = NewContractDataModel()
    private var test1 : [AppContract]
    init(){
        
        test1 = newContractDataModel.sortByDateASC()
        print("Test size \(test1.count)")
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Ablaufende Verträge").font(.title2)
            Color.white
        }
    }
}
