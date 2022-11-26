//
//  PDFCreator.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 26.11.22.
//

import Foundation
import PDFKit

class PDFCreator {
    
    private var fieldInfo : FieldInformation
    private var appContract : AppContract
    init(fieldInfo : FieldInformation, appContract : AppContract)
    {
        self.fieldInfo = fieldInfo
        self.appContract = appContract
    }
    

    func createPdf() {

            let outputFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("yourFileName.pdf")
            let title = "Your Title\n"
        let text = String(repeating: appContract.firstName ?? "", count: 1)

            let titleAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 1)]
            let textAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]

            let formattedTitle = NSMutableAttributedString(string: title, attributes: titleAttributes)
            let formattedText = NSAttributedString(string: text, attributes: textAttributes)
        
        
        for i in fieldInfo.pictureArray
        {
            let image1Attachment = NSTextAttachment()
            image1Attachment.image = i.picutre
            image1Attachment.setImageHeight(height: 50)
            let image1String = NSAttributedString(attachment: image1Attachment)
            formattedTitle.append(image1String)
        }
           
        
        

            formattedTitle.append(formattedText)

            // 1. Create Print Formatter with your text.

            let formatter = UISimpleTextPrintFormatter(attributedText: formattedTitle)

            // 2. Add formatter with pageRender

            let render = UIPrintPageRenderer()
            render.addPrintFormatter(formatter, startingAtPageAt: 0)

            // 3. Assign paperRect and printableRect

            let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
            let printable = page.insetBy(dx: 0, dy: 0)

            render.setValue(NSValue(cgRect: page), forKey: "paperRect")
            render.setValue(NSValue(cgRect: printable), forKey: "printableRect")

            // 4. Create PDF context and draw
            let rect = CGRect.zero

            let pdfData = NSMutableData()
            UIGraphicsBeginPDFContextToData(pdfData, rect, nil)

            for i in 1...render.numberOfPages {

                UIGraphicsBeginPDFPage();
                let bounds = UIGraphicsGetPDFContextBounds()
                render.drawPage(at: i - 1, in: bounds)
            }

            UIGraphicsEndPDFContext();

            // 5. Save PDF file

            do {
                try pdfData.write(to: outputFileURL, options: .atomic)

                print("wrote PDF file with multiple pages to: \(outputFileURL.path)")
            } catch {

                 print("Could not create PDF file: \(error.localizedDescription)")
            }
        }
}

