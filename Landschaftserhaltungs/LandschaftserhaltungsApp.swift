//
//  LandschaftserhaltungsApp.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import SwiftUI

@main
struct LandschaftserhaltungsApp: App {
    @ObservedObject var appState = AppState(hasOnboarded: false)
    var body: some Scene {
        WindowGroup {
            
            if appState.hasOnboarded{
                MainSide().environmentObject(appState)
            } else {
                OnboardingFlowView().environmentObject(appState)
            }
        }
    }
}
