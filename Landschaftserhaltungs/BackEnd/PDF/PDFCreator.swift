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

    func generatePdf(listEntry : ListEntry)
    {
        url =  getDocumentsDirectory().appendingPathComponent("awesome.pdf")
       // var url = URL(string: "file://~/Desktop/awesome.pdf")!
        let document = PDFDocument(format: .a4)
        document.add(.contentCenter, text: "Create PDF documents easily.")
        let generator = PDFGenerator(document: document)
        generator.debug = true
        url =  try! generator.generateURL(filename: "Example.pdf")
       // print("Output URL:", url)

    }
    
    
    func generatePdfAndGetURL(listEntry : ListEntry) -> URL {
        url =  getDocumentsDirectory().appendingPathComponent("awesome.pdf")
        let document = PDFDocument(format: .a4)
        let imageElementHeader = PDFImage(image: listEntry.contract?.picture ?? UIImage(), size: CGSize(width: 150, height: 80))
        let imageOverViewPic = PDFImage(image: listEntry.contract?.picture ?? UIImage())

        let headingStyle1 = document.add(style: PDFTextStyle(name: "Heading 1",
                                                             font: Font.boldSystemFont(ofSize: 20.0),
                                                             color: Color.black))
        let style = PDFLineStyle(type: .full, color: .darkGray, width: 0.5)
        
        
        
        //Header
        document.add(.headerRight, image: imageElementHeader)
        
        //Body
        document.add(textObject: PDFSimpleText(text: "Flächenbeurteilung der Vertragsflächen", style: headingStyle1))
        document.add(.contentLeft, text: " ")
        document.add(.contentLeft, text: "Zu: ")
        document.add(.contentLeft, text: "\(listEntry.contract?.lastName ?? ""),  \(listEntry.contract?.firstName ?? " ")")
        document.add(.contentLeft, text: "Neuvertrag")
        document.add(.contentLeft, text: "\(listEntry.contract?.particularities ?? " ")")
        document.addLineSeparator(PDFContainer.contentLeft, style: style)
        document.add(space: 15.0)
        document.add(.contentCenter, image: imageOverViewPic)
        document.createNewPage()
        
        
       
        
        
        
        
        let generator = PDFGenerator(document: document)
        url =  try! generator.generateURL(filename: "Example.pdf")
        return url!
    }
    
    func getUrl() -> URL
    {
        return url!
    }
    
  
    }
