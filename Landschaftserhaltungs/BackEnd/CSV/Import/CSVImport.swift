//
//  CSVImport.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 29.11.22.
//

import Foundation
import UniformTypeIdentifiers
import UIKit


class CSVImport : UIViewController, UIDocumentPickerDelegate{
    
    let supportedFiles : [UTType] = [UTType.data]
    
    
    func importCSV()
    {
        let controller = UIDocumentPickerViewController(forOpeningContentTypes: supportedFiles, asCopy: true)
        
        controller.delegate = self
        controller.allowsMultipleSelection = false
        UIApplication.shared.windows.first?.rootViewController?.present(controller, animated: true, completion: nil)
    }
    
    

      
    
    
    
}
