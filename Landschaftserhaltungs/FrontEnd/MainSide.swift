//
//  MainSide.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import Foundation
import SwiftUI

struct MainSide:  View {
    @EnvironmentObject var appState : AppState
    var body: some View {
        //Verwalten
        // Neu anlegen
        // Auslaufende Verträge
        
        VStack(alignment: .leading)
        {
            Button("Neuen Vertrag anlegen")
            {
                
            }.foregroundColor(.white)
                .padding()
                .background(Color.blue)
            Button("Vertäge verwalten")
            {
                
            }
            Button("Auslaufende Verträge")
            {
                
            }
        }
            .padding(.top)
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .topLeading
                ).fullBackground(imageName: "NatureLaunch")
        

    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MainSide()
    }
}
