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





struct ExportPreviewPDFOtherBiotop: View {
    let pdfView = PDFView()
    @StateObject var listEntry : ListEntry
    private  let pdf = PDFCreatorDiffrentBiotop()
    @State private var showSheet = false

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
 
        guard let pdfDoc = PDFDocument(url: pdf.generatePdfAndGetURL(listEntry: listEntry ))?.documentURL else {return}
        let shareSheetVC = UIActivityViewController(activityItems: [pdfDoc], applicationActivities:  [])
        UIApplication.shared.windows.first?.rootViewController?.present(shareSheetVC, animated: true, completion: nil)
    }
    
    
}
