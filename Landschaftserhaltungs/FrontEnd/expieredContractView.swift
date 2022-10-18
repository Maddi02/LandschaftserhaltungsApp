//
//  expieredContractView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 18.10.22.
//

import SwiftUI

struct expieredContractView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Ablaufende Verträge").font(.title2)
            Color.white
        }
    }
}

struct expieredContractView_Previews: PreviewProvider {
    static var previews: some View {
        expieredContractView()
    }
}
