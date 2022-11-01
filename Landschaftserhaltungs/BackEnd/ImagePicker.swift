//
//  ImagePicker.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 19.10.22.
//
import Foundation
import SwiftUI
import UIKit
import CoreData


struct ImagePicker: UIViewControllerRepresentable {
    var appContract : AppContract
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage
    
    @Environment(\.presentationMode) private var presentationMode
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        appContract.picture = selectedImage
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePicker
        
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                
                parent.selectedImage = image
                
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
}
