//
//  EditContract.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 25.10.22.
//

import SwiftUI

struct EditContract: View {
    
    var appContract : AppContract
    
    
    var body: some View {
        Text(appContract.firstName ?? "NO Data")
    }
}
/*
struct EditContract_Previews: PreviewProvider {
    static var previews: some View {
        EditContract()
    }
}
*/
