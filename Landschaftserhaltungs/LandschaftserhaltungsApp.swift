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
    
    let container = CoreDataManager.shared // <- so need add this line
    @ObservedObject var appState = AppState(hasOnboarded:/*false*/ UserDefaults.standard.bool(forKey: "onBoarded")) // this loads the info from storage so that the app knows if the User has onboarded already.
    var body: some Scene {
        WindowGroup {
            if appState.hasOnboarded{
                MainSideView().environment(\.managedObjectContext, container.persistentContainer.viewContext)
            } else {
                OnboardingFlowView().environment(\.managedObjectContext, container.persistentContainer.viewContext)
            }
        }
    }
}
