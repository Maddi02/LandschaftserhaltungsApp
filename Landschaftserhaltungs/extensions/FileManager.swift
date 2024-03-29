//
//  FileManager.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 22.11.22.
//

import Foundation
import UIKit

let fileName = ""

extension FileManager {
    static var docDirURL: URL {
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func docExist(named docName: String) -> Bool {
        fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
}
