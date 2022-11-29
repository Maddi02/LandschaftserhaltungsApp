//
//  CSVImport.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 29.11.22.
//

import Foundation
import UniformTypeIdentifiers
import UIKit

/// NOT LONGER NEEDED
class CSVImport : UIViewController, UIDocumentPickerDelegate{
    
    let supportedFiles : [UTType] = [UTType.data]
    
    
    func importCSV()
    {
        let controller = UIDocumentPickerViewController(forOpeningContentTypes: supportedFiles, asCopy: true)
        
        controller.delegate = self
        controller.allowsMultipleSelection = false
        UIApplication.shared.windows.first?.rootViewController?.present(controller, animated: true, completion: nil)
        
        print("a file was selected")

        /*
        let rows = NSArray(contentsOfCSVURL: url, options : CHCSVParserOptions.sanitizesFields)!
        
        for row in rows{
            print(row)
        }
         */
    }
    
    

      
    
    
    
}