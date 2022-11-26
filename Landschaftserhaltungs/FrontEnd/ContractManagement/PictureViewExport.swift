//
//  PictureViewExportFFH.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 25.11.22.
//

import SwiftUI

struct PictureViewExport :View
{
    var fieldInformation : FieldInformation
    
    var body : some View
    
    {
        Text("Anzahl der Fotos \(fieldInformation.pictureArray.count)")
        
        
        ForEach(fieldInformation.pictureArray, id: \.self)
        {
            
            i in
            Image(uiImage: i.picutre ?? UIImage()).resizable().scaledToFit()
        }
    }
    
}
