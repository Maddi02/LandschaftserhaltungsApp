//
//  ExportForeCast.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI
import PDFKit



struct ExportPreviewPDFFFH: View {
    private  let pdf = PDFCreatorFFH()
    @StateObject var listEntry: ListEntry
    
    var body: some View {
        
        VStack{
            PDFKitView(showing: PDFDocument(url: pdf.generatePdfAndGetURL(listEntry: listEntry))!)
            HStack{
            
                Button {
                    presentShareSheet()
                } label: {
                    Label("Teilen", systemImage: "square.and.arrow.up").frame(maxWidth: .infinity , alignment: .trailing).padding(.trailing , 30)
                }
            }
        }
    }

    
    private func presentShareSheet(){
        guard let pdfDoc = PDFDocument(url: pdf.generatePdfAndGetURL(listEntry: listEntry))?.documentURL else {return}
        let shareSheetVC = UIActivityViewController(activityItems: [pdfDoc], applicationActivities:  [])
        UIApplication.shared.windows.first?.rootViewController?.present(shareSheetVC, animated: true, completion: nil)
    }
}


