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
    
    @Published var image = UIImage()
    
    
    

    
    
    init() {
        self.firstName = UserDefaults.standard.object(forKey: "firstName") as? String ?? ""
        self.lastName = UserDefaults.standard.object(forKey: "lastName") as? String ?? ""
        self.language = UserDefaults.standard.object(forKey: "language") as? String ?? ""
        

        
        loadImage()
        

    }
    
    func saveImage(image : UIImage) {
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        let encoded = try! PropertyListEncoder().encode(data)
        UserDefaults.standard.set(encoded, forKey: "KEY")
    }
    
    func loadImage() {
        print("Hekk")
        guard let data = UserDefaults.standard.data(forKey: "KEY") else { return }
        let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
        let image = UIImage(data: decoded)
        self.image = image ?? UIImage()
    }
    
    func getImage() ->UIImage
    {
        loadImage()
        return self.image
    }
}
