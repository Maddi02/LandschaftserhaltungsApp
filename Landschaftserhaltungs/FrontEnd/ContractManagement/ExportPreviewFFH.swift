//
//  ExportForeCast.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI
import PDFKit



struct ExportPreviewFFH: View {
    private  let pdf = PDFFromGit()
    @StateObject var listEntry: ListEntry
    
    var body: some View {
        
        VStack{
            PDFKitView(showing: PDFDocument(url: pdf.generatePdfAndGetURL())!)
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
        pdf.generatePdf()
        guard let pdfDoc = PDFDocument(url: pdf.getUrl())?.documentURL else {return}
        let shareSheetVC = UIActivityViewController(activityItems: [pdfDoc], applicationActivities:  [])
        UIApplication.shared.windows.first?.rootViewController?.present(shareSheetVC, animated: true, completion: nil)
    }
}


