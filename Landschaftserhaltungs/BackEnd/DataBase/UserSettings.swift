//
//  UserSettings.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 22.11.22.
//

import Foundation
import Combine
import UIKit

public class UserSettings: ObservableObject {
    @Published var firstName: String {
        didSet {
            UserDefaults.standard.set(firstName, forKey: "firstName")
        }
    }
    
    @Published var lastName: String {
        didSet {
            UserDefaults.standard.set(lastName, forKey: "lastName")
        }
    }
    
    @Published var language: String {
        didSet {
            UserDefaults.standard.set(language, forKey: "language")
        }
    }

    
    
    init() {
        self.firstName = UserDefaults.standard.object(forKey: "firstName") as? String ?? ""
        self.lastName = UserDefaults.standard.object(forKey: "lastName") as? String ?? ""
        self.language = UserDefaults.standard.object(forKey: "language") as? String ?? ""
    }
}
