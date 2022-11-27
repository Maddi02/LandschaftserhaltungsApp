//
//  PDFKitView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 27.11.22.
//

import Foundation
import UIKit
import PDFKit
import SwiftUI
struct PDFKitView: UIViewRepresentable {
    
    let pdfDocument: PDFDocument
   
    init(showing pdfDoc: PDFDocument) {
        self.pdfDocument = pdfDoc
    }
    
    //you could also have inits that take a URL or Data
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true

        return pdfView
    }
    
    func updateUIView(_ pdfView: PDFView, context: Context) {
        pdfView.document = pdfDocument
    }
}
