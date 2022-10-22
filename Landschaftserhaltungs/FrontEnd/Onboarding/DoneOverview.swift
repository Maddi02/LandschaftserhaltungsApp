//
//  DoneOverview.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import SwiftUI

struct DoneOverview: View {
    @EnvironmentObject var appState : AppState
    var body: some View {
        VStack{
            Text("So lets finally start")
            Button("Lets Start "){
                appState.hasOnboarded = true
                UserDefaults.standard.set(appState.hasOnboarded, forKey: "onBoarded")
            }
        }
      
        
    }
}

struct DoneOverview_Previews: PreviewProvider {
    static var previews: some View {
        DoneOverview()
    }
}
