//
//  UIImageTransformer.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 22.10.22.
//

import Foundation
import UIKit

class UIImageTransformer: ValueTransformer {
    
    let defaults = UserDefaults.standard
    
    override func transformedValue(_ value: Any?) -> Any? {
        
        guard let image = value as? UIImage else {
            return nil
        }
        
        var photoQuality = defaults.double(forKey: "photoQuality")
        
        if photoQuality == 0
        {
            photoQuality = 1.0
        }
        
        guard let scaledImage = image.resizeImage(targetRatio: photoQuality) else {
            return nil
        }
        
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: scaledImage, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
        
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else {
            return nil
        }
        
        
        do{
            let image = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data)
            return image
        } catch{
            return nil
        }
    }
    
}
