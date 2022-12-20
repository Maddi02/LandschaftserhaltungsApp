//
//  DocumentPickerCSV.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 20.12.22.
//
import Foundation
import UIKit
import SwiftUI

struct DocumentPickerCSV: UIViewControllerRepresentable
{
    
    @Binding var content: String
    @Binding var urlCSV: URL
       
       func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPickerCSV>) -> UIDocumentPickerViewController {
           let controller = UIDocumentPickerViewController(forOpeningContentTypes: [.text], asCopy: true)
           controller.allowsMultipleSelection = false
           controller.delegate = context.coordinator

           return controller
       }
       
       func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPickerCSV>) {}
       
       func makeCoordinator() ->  DocumentPickerCoordinatorCSV
       {
           return DocumentPickerCoordinatorCSV(content: $content, urlCSV: $urlCSV)
       }
}
