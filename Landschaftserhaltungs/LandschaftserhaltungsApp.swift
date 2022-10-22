//
//  LandschaftserhaltungsApp.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import SwiftUI
import Foundation
@main
struct LandschaftserhaltungsApp: App {
    
    @StateObject private var dataController = DataController()
    @ObservedObject var appState = AppState(hasOnboarded: UserDefaults.standard.bool(forKey: "onBoarded")) // this loads the info from storage so that the app knows if the User has onboarded already.
    var body: some Scene {
        WindowGroup {
            if appState.hasOnboarded{
                MainSideView().environment(\.managedObjectContext, dataController.container.viewContext)
            } else {
                OnboardingFlowView().environmentObject(appState).environment(\.managedObjectContext, dataController.container.viewContext)
            }
        }
    }
}
