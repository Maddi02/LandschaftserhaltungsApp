//
//  ExportPreviewOtherBiotop.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 23.11.22.
//

import SwiftUI
import PDFKit







struct PictureViewExportDiffrentBiotop :View
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





struct ExportPreviewOtherBiotop: View {
    let pdfView = PDFView()
    @StateObject var listEntry : ListEntry
    private  let pdf = PDFFromGit()
    @State private var showSheet = false

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
