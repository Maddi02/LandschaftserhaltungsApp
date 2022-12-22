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
            
          
            Text("Onboarding abgeschlossen\n")
            Button("Starten"){
                print(defaults.bool(forKey: "realOnboarding"))
                appState.hasOnboarded = true
                UserDefaults.standard.set(appState.hasOnboarded, forKey: "onBoarded")
                
                if(!defaults.bool(forKey: "realOnboarding"))
                {
                    NavigationUtil.popToRootView()
                }
            } .frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
}

struct DoneOverview_Previews: PreviewProvider {
    static var previews: some View {
        DoneOverview()
    }
}
