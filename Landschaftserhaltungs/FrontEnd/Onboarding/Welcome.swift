//
//  WelcomeAndGenerateFolder.swift
//  Landschaftserhaltungs
//
//  Created by Marc Biehler on 19.12.22.
//

import SwiftUI

struct Welcome: View {
    
    var body: some View {
        
        VStack{
            
            Text("Herzlich Willkommen")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            
            Text("Mithilfe dieser App können Sie ihre Landschaftspflegeverträge verwalten und Landschaftsflächen digital erfassen.")
                .multilineTextAlignment(.center)
                .padding()
                .font(.system(size: 14))
            
        }
        
        
        
        
    }

}


