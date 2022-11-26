//
//  PDFWEB.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 26.11.22.
//

import Foundation
import PDFKit
import TPPDF
class PDFFromGit
{

    
   
    
    
    
    
    func generatePdf()
    {

        var url = URL(string: "file://~/Desktop/awesome.pdf")!
        let document = PDFDocument(format: .a4)
        document.add(.contentCenter, text: "Create PDF documents easily.")
        let generator = PDFGenerator(document: document)
        generator.debug = true
        url =  try! generator.generateURL(filename: "Example.pdf")
        print("Output URL:", url)
    }
    
    
  
        
    }
