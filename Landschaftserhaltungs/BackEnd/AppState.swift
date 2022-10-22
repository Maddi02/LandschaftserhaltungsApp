//
//  AppState.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 18.10.22.
//

import Foundation

class AppState: ObservableObject
{
    
    @Published var hasOnboarded : Bool

    init(hasOnboarded: Bool)
    {
        self.hasOnboarded = hasOnboarded
    }
    
}

