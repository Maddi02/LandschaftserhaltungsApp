//
//  UIImageTransformer.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 22.10.22.
//

import Foundation
import UIKit

class UIImageTransformer: ValueTransformer {
    
    override func transformedValue(_ value: Any?) -> Any? {
        
        guard var image = value as? UIImage else {
            return nil
        }
        
        do{
            image = image.resizeImage(targetRatio: 0.5)
            let data = try NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: true)
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
