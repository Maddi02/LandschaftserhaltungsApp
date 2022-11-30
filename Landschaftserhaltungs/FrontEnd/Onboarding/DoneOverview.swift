//
//  DoneOverview.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import SwiftUI

struct DoneOverview: View {
    let defaults = UserDefaults.standard
    @EnvironmentObject var appState : AppState
    var body: some View {
        VStack{
            
          
            Text("So lets finally start")
            Button("Lets Start "){
                print(defaults.bool(forKey: "realOnboarding"))
                appState.hasOnboarded = true
                UserDefaults.standard.set(appState.hasOnboarded, forKey: "onBoarded")
                
                if(!defaults.bool(forKey: "realOnboarding"))
                {
                    NavigationUtil.popToRootView()
                }
            }
        }
    }
}

struct DoneOverview_Previews: PreviewProvider {
    static var previews: some View {
        DoneOverview()
    }
}
