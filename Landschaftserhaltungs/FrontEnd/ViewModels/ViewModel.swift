//
//  ViewModel.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 22.11.22.
//

import Foundation
import SwiftUI
class ViewModel: ObservableObject {
    
    @Published var image : UIImage?
    @Published var showPicker = false
    @Published var source : PickerModel.Source = .library
    @Published var showCameraAlert = false
    @Published var cameraError : PickerModel.CamerErrorTyp?
    
    func showPhotoPicker() {
        
        do {
            if source == .camera{
                try PickerModel.checkPermission()
            }
            showPicker = true
        } catch {
            showCameraAlert = true
            cameraError = PickerModel.CamerErrorTyp(error: error as! PickerModel.PickerError)
        }
    }
}
