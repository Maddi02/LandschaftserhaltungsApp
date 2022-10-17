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
        GeometryReader { geometry in
            VStack(alignment: .leading)
            {
                Image("LandschaftserhaltungsVerbandLogo").resizable().aspectRatio(contentMode: .fit)
                Button("Neuen Vertrag anlegen")
                {
                    
                }.foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    
                
                Button("Verträge verwalten")
                {
                    
                }.foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    
                
                Button("Auslaufende Verträge")
                {
                    
                }.foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.5))
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
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MainSide()
    }
}

