//
//  DocumentPickerCoordinatorCSV.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 20.12.22.
//

import Foundation
import UIKit
import SwiftUI
class DocumentPickerCoordinatorCSV: NSObject, UIDocumentPickerDelegate, UINavigationControllerDelegate, ObservableObject
{
    @Published  var url : String = " "
    let defaults = UserDefaults.standard
    @Binding var content: String
    @Binding var urlCSV: URL
        
    init(content: Binding<String>, urlCSV : Binding<URL>) {
            _content = content
            _urlCSV = urlCSV
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            let fileURL = urls[0]
            
            do
            {
                content = try String(contentsOf: fileURL, encoding: .utf8)
                urlCSV = fileURL
                print(content)
                print("\(fileURL.lastPathComponent)oirehufiöh")
                defaults.set(fileURL.lastPathComponent, forKey: "csvICloud")
            }
            
            catch let error
            {
                print("test test test")
                print(error.localizedDescription)
            }
        }
}
