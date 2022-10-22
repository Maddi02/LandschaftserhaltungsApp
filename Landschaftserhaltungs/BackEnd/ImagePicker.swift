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

private var context = CoreDataManager.shared.persistentContainer.viewContext
struct ImagePicker: UIViewControllerRepresentable {
    
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
        
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagePicker
        var test = AppContract(context: context);
        
        init(_ parent: ImagePicker) {
            self.parent = parent
            
            print("HEHHH")
            let request : NSFetchRequest<AppContract> = NSFetchRequest(entityName: "AppContract")
            
            do{
                let test: [AppContract] = try context.fetch(request)
                if let test = test.first{
                    print(test.firstName ??  "FUCK")
                }
            }
            
            catch{
                print(error)
            }
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                
                parent.selectedImage = image
                test.picture = image
                test.firstName = "Heidi"
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
