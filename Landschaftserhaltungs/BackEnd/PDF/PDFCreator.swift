//
//  PDFWEB.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 26.11.22.
//

import Foundation
import PDFKit
import TPPDF
class PDFCreator
{
    var  url = URL(string: "")
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }

    func generatePdf()
    {
        url =  getDocumentsDirectory().appendingPathComponent("awesome.pdf")
       // var url = URL(string: "file://~/Desktop/awesome.pdf")!
        let document = PDFDocument(format: .a4)
        document.add(.contentCenter, text: "Emty pdf.")
        let generator = PDFCreator(document: document)
        generator.debug = true
        url =  try! generator.generateURL(filename: "Example.pdf")
       // print("Output URL:", url)

    }
    
    
    func generatePdfAndGetURL() -> URL {
        url =  getDocumentsDirectory().appendingPathComponent("awesome.pdf")
       // var url = URL(string: "file://~/Desktop/awesome.pdf")!
        let document = PDFDocument(format: .a4)
        document.add(.contentCenter, text: "Emty pdf.")
        let generator = PDFCreator(document: document)
        generator.debug = true
        url =  try! generator.generateURL(filename: "Example.pdf")
        return url!
    }
    
    func getUrl() -> URL
    {
        return url!
    }
    
    
  
        
    }
