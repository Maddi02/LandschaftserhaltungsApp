//
//  DocumentPicker.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 16.12.22.
//
import Foundation
import UIKit
import SwiftUI

struct DocumentPicker: UIViewControllerRepresentable
{
    
    @Binding var content: UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) -> UIDocumentPickerViewController {
        let controller = UIDocumentPickerViewController(forOpeningContentTypes: [.image], asCopy: true)
        controller.allowsMultipleSelection = false
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>) {}
    
    func makeCoordinator() ->  DocumentPickerCoordinator
    {
        return DocumentPickerCoordinator(content: $content)
    }
}
